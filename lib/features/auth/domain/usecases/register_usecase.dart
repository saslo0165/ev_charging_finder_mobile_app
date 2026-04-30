import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Input parameters — immutable value object.
class RegisterParams {
  final String email;
  final String fullName;
  final bool isGuest;
  final String password;
  final String phone;
  final String role;

  const RegisterParams({
    required this.email,
    required this.fullName,
    required this.isGuest,
    required this.password,
    required this.phone,
    required this.role,
  });
}

/// Registers a new user via [AuthRepository].
/// Returns [Right<UserEntity>] on success, [Left<Failure>] on error.
class RegisterUseCase {
  final AuthRepository _repository;

  const RegisterUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call(RegisterParams params) =>
      _repository.register(
        email: params.email,
        fullName: params.fullName,
        isGuest: params.isGuest,
        password: params.password,
        phone: params.phone,
        role: params.role,
      );
}
