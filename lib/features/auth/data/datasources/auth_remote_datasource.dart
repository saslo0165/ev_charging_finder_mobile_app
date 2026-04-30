import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../models/user_model.dart';

/// Contract for raw API calls — isolates Dio from the repository.
abstract interface class AuthRemoteDataSource {
  Future<UserModel> register({
    required String email,
    required String fullName,
    required bool isGuest,
    required String password,
    required String phone,
    required String role,
  });

  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<UserModel> getMe(String token);

  Future<UserModel> updateProfile({
    required String token,
    required String fullName,
    required String phone,
  });

  Future<void> logout({required String token});

  /// Verify the OTP sent to [email]. Returns [UserModel] on success.
  // Future<UserModel> verifyOtp({
  //   required String email,
  //   required String otp,
  // });
}

/// Concrete implementation using Dio.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  const AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<UserModel> register({
    required String email,
    required String fullName,
    required bool isGuest,
    required String password,
    required String phone,
    required String role,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: {
          'email': email,
          'full_name': fullName,
          'is_guest': isGuest,
          'password': password,
          'phone': phone,
          'role': role,
        },
      );
      final data = response.data;
      if (data == null || data is! Map) {
        throw const UnknownFailure(message: 'Invalid response from server');
      }

      final json = Map<String, dynamic>.from(data);
      // Try to get nested user first, fallback to root
      final userJson = (json['user'] as Map<dynamic, dynamic>?)?.cast<String, dynamic>() ?? json;
      final accessToken = json['access_token'] as String?;

      return UserModel.fromJson(userJson).copyWith(accessToken: accessToken);
    } on DioException catch (e) {
      throw _mapDioToFailure(e);
    }
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      final data = response.data;
      if (data == null || data is! Map) {
        throw const UnknownFailure(message: 'Invalid response from server');
      }

      final json = Map<String, dynamic>.from(data);
      final userJson = (json['user'] as Map<dynamic, dynamic>?)?.cast<String, dynamic>();
      if (userJson == null) {
        throw const UnknownFailure(message: 'User data missing in response');
      }
      final accessToken = json['access_token'] as String?;

      return UserModel.fromJson(userJson).copyWith(accessToken: accessToken);
    } on DioException catch (e) {
      throw _mapDioToFailure(e);
    }
  }

  @override
  Future<UserModel> updateProfile({
    required String token,
    required String fullName,
    required String phone,
  }) async {
    try {
      final response = await _dio.put(
        '/auth/me',
        data: {
          'full_name': fullName,
          'phone': phone,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final data = response.data;
      if (data == null || data is! Map) {
        throw const UnknownFailure(message: 'Invalid response from server');
      }

      final json = Map<String, dynamic>.from(data);
      // Backend returns the user object directly or nested under 'user'
      final userJson = (json['user'] as Map<dynamic, dynamic>?)?.cast<String, dynamic>() ?? json;
      
      return UserModel.fromJson(userJson);
    } on DioException catch (e) {
      throw _mapDioToFailure(e);
    }
  }

  @override
  Future<void> logout({required String token}) async {
    try {
      await _dio.post(
        '/auth/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioException catch (e) {
      throw _mapDioToFailure(e);
    }
  }

  @override
  Future<UserModel> getMe(String token) async {
    try {
      print('DEBUG: API Request: GET /auth/me');
      final response = await _dio.get(
        '/auth/me',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print('DEBUG: API Response Status: ${response.statusCode}');

      final data = response.data;
      if (data == null || data is! Map) {
        throw const UnknownFailure(message: 'Invalid response from server');
      }

      final json = Map<String, dynamic>.from(data);
      final userJson = (json['user'] as Map<dynamic, dynamic>?)?.cast<String, dynamic>();
      if (userJson == null) {
        throw const UnknownFailure(message: 'User data missing in response');
      }
      final accessToken = json['access_token'] as String?;

      return UserModel.fromJson(userJson).copyWith(accessToken: accessToken);
    } on DioException catch (e) {
      throw _mapDioToFailure(e);
    }
  }

  // Future<UserModel> verifyOtp({
  //   required String email,
  //   required String otp,
  // }) async {
  //   try {
  //     final response = await _dio.post(
  //       '/auth/verify-otp',
  //       data: {'email': email, 'otp': otp},
  //     );
  //     return UserModel.fromJson(response.data as Map<String, dynamic>);
  //   } on DioException catch (e) {
  //     throw _mapDioToFailure(e);
  //   }
  // }

  /// Maps Dio exceptions to typed domain Failures.
  Failure _mapDioToFailure(DioException e) {
    final detailedMessage = e.message ?? e.error?.toString() ?? 'Connection failed';
    
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return NetworkFailure(message: 'Network error: $detailedMessage');
    }
    
    final code = e.response?.statusCode ?? 500;
    final msg = (e.response?.data as Map<String, dynamic>?)?['message']
            as String? ??
        'Server error: $detailedMessage';
    return ServerFailure(message: msg, statusCode: code);
  }
}
