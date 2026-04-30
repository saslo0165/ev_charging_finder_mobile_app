import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class UpdateProfileUseCase {
  final AuthRepository _repository;

  const UpdateProfileUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call(UpdateProfileParams params) {
    return _repository.updateProfile(
      token: params.token,
      fullName: params.fullName,
      phone: params.phone,
    );
  }
}

class UpdateProfileParams {
  final String token;
  final String fullName;
  final String phone;

  const UpdateProfileParams({
    required this.token,
    required this.fullName,
    required this.phone,
  });
}
