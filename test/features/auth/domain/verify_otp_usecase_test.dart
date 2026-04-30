// // ignore_for_file: depend_on_referenced_packages
//
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:fpdart/fpdart.dart';
//
// import 'package:ev_charging_finder/core/error/failures.dart';
// import 'package:ev_charging_finder/features/auth/domain/entities/user_entity.dart';
// import 'package:ev_charging_finder/features/auth/domain/repositories/auth_repository.dart';
// import 'package:ev_charging_finder/features/auth/domain/usecases/verify_otp_usecase.dart';
//
// import 'verify_otp_usecase_test.mocks.dart';
//
// @GenerateMocks([AuthRepository])
// void main() {
//   late MockAuthRepository mockAuthRepository;
//   late VerifyOtpUseCase useCase;
//
//   const tEmail = 'john@example.com';
//   const tOtp = '12345';
//   const tUser = UserEntity(
//     id: 'u1',
//     name: 'John',
//     phone: '9876543210',
//     email: tEmail,
//     accessToken: 'tok_verified',
//   );
//
//   setUp(() {
//     mockAuthRepository = MockAuthRepository();
//     useCase = VerifyOtpUseCase(mockAuthRepository);
//     // fpdart Either is not auto-inferred by Mockito — provide a dummy value.
//     provideDummy<Either<Failure, UserEntity>>(const Right(tUser));
//   });
//
//   group('VerifyOtpUseCase', () {
//     test('should_returnUser_whenOtpIsCorrect', () async {
//       // Arrange
//       when(mockAuthRepository.verifyOtp(email: tEmail, otp: tOtp))
//           .thenAnswer((_) async => const Right(tUser));
//
//       // Act
//       final result = await useCase(
//         const VerifyOtpParams(email: tEmail, otp: tOtp),
//       );
//
//       // Assert
//       expect(result, const Right(tUser));
//       verify(mockAuthRepository.verifyOtp(email: tEmail, otp: tOtp)).called(1);
//     });
//
//     test('should_returnValidationFailure_whenOtpIsWrong', () async {
//       // Arrange
//       when(mockAuthRepository.verifyOtp(
//         email: anyNamed('email'),
//         otp: anyNamed('otp'),
//       )).thenAnswer(
//         (_) async => const Left(ValidationFailure(message: 'Invalid OTP')),
//       );
//
//       // Act
//       final result = await useCase(
//         const VerifyOtpParams(email: tEmail, otp: '99999'),
//       );
//
//       // Assert
//       expect(result, const Left(ValidationFailure(message: 'Invalid OTP')));
//     });
//
//     test('should_returnNetworkFailure_whenNoInternet', () async {
//       // Arrange
//       when(mockAuthRepository.verifyOtp(
//         email: anyNamed('email'),
//         otp: anyNamed('otp'),
//       )).thenAnswer(
//         (_) async => const Left(NetworkFailure(message: 'No internet')),
//       );
//
//       // Act
//       final result = await useCase(
//         const VerifyOtpParams(email: tEmail, otp: tOtp),
//       );
//
//       // Assert
//       expect(result, const Left(NetworkFailure(message: 'No internet')));
//     });
//   });
// }
