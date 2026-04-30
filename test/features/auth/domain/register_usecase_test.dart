import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fpdart/fpdart.dart';

import 'package:ev_charging_finder/core/error/failures.dart';
import 'package:ev_charging_finder/features/auth/domain/entities/user_entity.dart';
import 'package:ev_charging_finder/features/auth/domain/repositories/auth_repository.dart';
import 'package:ev_charging_finder/features/auth/domain/usecases/register_usecase.dart';

import 'register_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late RegisterUseCase useCase;

  // Shared test data
  const tEmail = 'shashank@gmail.com';
  const tFullName = 'Shashank';
  const tPassword = 'password123';
  const tPhone = '1234567890';
  final tCreatedAt = DateTime.parse('2026-04-29T12:21:19.067902+05:30');

  final tUser = UserEntity(
    id: 6,
    fullName: tFullName,
    email: tEmail,
    phone: tPhone,
    avatarUrl: null,
    isGuest: false,
    isActive: true,
    role: 'user',
    createdAt: tCreatedAt,
  );

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = RegisterUseCase(mockAuthRepository);
    // fpdart Either is not auto-inferred by Mockito — provide a dummy value.
    provideDummy<Either<Failure, UserEntity>>(Right(tUser));
  });

  group('RegisterUseCase', () {
    test('should_returnUser_whenRegisterSucceeds', () async {
      // Arrange
      when(mockAuthRepository.register(
        email: tEmail,
        fullName: tFullName,
        isGuest: false,
        password: tPassword,
        phone: tPhone,
        role: 'user',
      )).thenAnswer((_) async => Right(tUser));

      // Act
      final result = await useCase(
        const RegisterParams(
          email: tEmail,
          fullName: tFullName,
          isGuest: false,
          password: tPassword,
          phone: tPhone,
          role: 'user',
        ),
      );

      // Assert
      expect(result, Right(tUser));
      verify(mockAuthRepository.register(
        email: tEmail,
        fullName: tFullName,
        isGuest: false,
        password: tPassword,
        phone: tPhone,
        role: 'user',
      )).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should_returnNetworkFailure_whenNoInternet', () async {
      // Arrange
      when(mockAuthRepository.register(
        email: anyNamed('email'),
        fullName: anyNamed('fullName'),
        isGuest: anyNamed('isGuest'),
        password: anyNamed('password'),
        phone: anyNamed('phone'),
        role: anyNamed('role'),
      )).thenAnswer(
        (_) async => const Left(NetworkFailure(message: 'No internet')),
      );

      // Act
      final result = await useCase(
        const RegisterParams(
          email: tEmail,
          fullName: tFullName,
          isGuest: false,
          password: tPassword,
          phone: tPhone,
          role: 'user',
        ),
      );

      // Assert
      expect(result, const Left(NetworkFailure(message: 'No internet')));
    });

    test('should_returnServerFailure_whenApiReturns4xx', () async {
      // Arrange
      when(mockAuthRepository.register(
        email: anyNamed('email'),
        fullName: anyNamed('fullName'),
        isGuest: anyNamed('isGuest'),
        password: anyNamed('password'),
        phone: anyNamed('phone'),
        role: anyNamed('role'),
      )).thenAnswer(
        (_) async =>
            const Left(ServerFailure(message: 'Email already exists', statusCode: 409)),
      );

      // Act
      final result = await useCase(
        const RegisterParams(
          email: tEmail,
          fullName: tFullName,
          isGuest: false,
          password: tPassword,
          phone: tPhone,
          role: 'user',
        ),
      );

      // Assert
      expect(
        result,
        const Left(ServerFailure(message: 'Email already exists', statusCode: 409)),
      );
    });
  });
}
