import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';

/// Domain-layer contract — implementation lives in data layer.
/// No Dio, no Flutter, no concrete classes allowed here.
abstract interface class AuthRepository {
  /// Register a new user. Returns [UserEntity] on success.
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String fullName,
    required bool isGuest,
    required String password,
    required String phone,
    required String role,
  });

  /// Login a user. Returns [UserEntity] on success.
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  /// Fetch current user profile. Returns [UserEntity] on success.
  Future<Either<Failure, UserEntity>> getMe(String token);

  Future<Either<Failure, UserEntity>> updateProfile({
    required String token,
    required String fullName,
    required String phone,
  });

  Future<Either<Failure, void>> logout({required String token});

  /// Verify the OTP sent to [email]. Returns [UserEntity] on success.
  // Future<Either<Failure, UserEntity>> verifyOtp({
  //   required String email,
  //   required String otp,
  // });
}
