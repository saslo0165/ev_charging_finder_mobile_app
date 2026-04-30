// import 'package:fpdart/fpdart.dart';
// import '../../../../core/error/failures.dart';
// import '../entities/user_entity.dart';
// import '../repositories/auth_repository.dart';
//
// /// Input parameters — immutable value object.
// class VerifyOtpParams {
//   final String email;
//   final String otp;
//
//   const VerifyOtpParams({required this.email, required this.otp});
// }
//
// /// Verifies the OTP for the given email via [AuthRepository].
// /// Returns [Right<UserEntity>] on success, [Left<Failure>] on error.
// class VerifyOtpUseCase {
//   final AuthRepository _repository;
//
//   const VerifyOtpUseCase(this._repository);
//
//   Future<Either<Failure, UserEntity>> call(VerifyOtpParams params) =>
//       _repository.verifyOtp(
//         email: params.email,
//         otp: params.otp,
//       );
// }
