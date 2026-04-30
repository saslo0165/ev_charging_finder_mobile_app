import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

/// Concrete implementation of [AuthRepository].
/// Lives in data layer — the only place that knows about [AuthRemoteDataSource].
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  const AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String fullName,
    required bool isGuest,
    required String password,
    required String phone,
    required String role,
  }) async {
    try {
      final model = await _remoteDataSource.register(
        email: email,
        fullName: fullName,
        isGuest: isGuest,
        password: password,
        phone: phone,
        role: role,
      );
      return Right(model.toDomain());
    } on Failure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final model = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      return Right(model.toDomain());
    } on Failure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    required String token,
    required String fullName,
    required String phone,
  }) async {
    try {
      final model = await _remoteDataSource.updateProfile(
        token: token,
        fullName: fullName,
        phone: phone,
      );
      return Right(model.toDomain());
    } on Failure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout({required String token}) async {
    try {
      await _remoteDataSource.logout(token: token);
      return const Right(null);
    } on Failure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getMe(String token) async {
    try {
      final model = await _remoteDataSource.getMe(token);
      return Right(model.toDomain());
    } on Failure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, UserEntity>> verifyOtp({
  //   required String email,
  //   required String otp,
  // }) async {
  //   try {
  //     final model = await _remoteDataSource.verifyOtp(
  //       email: email,
  //       otp: otp,
  //     );
  //     return Right(model.toDomain());
  //   } on Failure catch (f) {
  //     return Left(f);
  //   } catch (e) {
  //     return Left(UnknownFailure(message: e.toString()));
  //   }
  // }
}
