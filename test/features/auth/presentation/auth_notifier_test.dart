import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fpdart/fpdart.dart';

import 'package:ev_charging_finder/core/error/failures.dart';
import 'package:ev_charging_finder/core/providers/auth_providers.dart';
import 'package:ev_charging_finder/features/auth/domain/entities/user_entity.dart';
import 'package:ev_charging_finder/features/auth/domain/repositories/auth_repository.dart';
import 'package:ev_charging_finder/features/auth/presentation/providers/auth_notifier.dart';
import 'package:ev_charging_finder/features/auth/presentation/providers/auth_state.dart';

import 'auth_notifier_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late ProviderContainer container;

  final tUser = UserEntity(
    id: 6,
    fullName: 'Shashank',
    email: 'shashank@gmail.com',
    phone: '1234567890',
    avatarUrl: null,
    isGuest: false,
    isActive: true,
    role: 'user',
    createdAt: DateTime.parse('2026-04-29T12:21:19.067902+05:30'),
  );

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    // fpdart Either is not auto-inferred by Mockito — provide a dummy value.
    provideDummy<Either<Failure, UserEntity>>(Right(tUser));

    // Override only the repository — use-cases and notifier wire themselves.
    container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(mockAuthRepository),
      ],
    );
  });

  tearDown(() => container.dispose());

  group('AuthNotifier - register', () {
    test('should_emitAuthenticated_whenRegisterSucceeds', () async {
      // Arrange
      when(mockAuthRepository.register(
        email: anyNamed('email'),
        fullName: anyNamed('fullName'),
        isGuest: anyNamed('isGuest'),
        password: anyNamed('password'),
        phone: anyNamed('phone'),
        role: anyNamed('role'),
      )).thenAnswer((_) async => Right(tUser));

      // Act
      final notifier = container.read(authProvider.notifier);
      await notifier.register(
        fullName: 'Shashank',
        phone: '1234567890',
        email: 'shashank@gmail.com',
        password: 'password123',
      );

      // Assert
      final state = container.read(authProvider);
      final data = (state as AsyncData<AuthState>).value;
      expect(data, isA<AuthAuthenticated>());
      expect((data as AuthAuthenticated).user, tUser);
    });

    test('should_emitError_whenRegisterFails', () async {
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
      final notifier = container.read(authProvider.notifier);
      await notifier.register(
        fullName: 'Shashank',
        phone: '1234567890',
        email: 'shashank@gmail.com',
        password: 'password123',
      );

      // Assert
      final state = container.read(authProvider);
      final data = (state as AsyncData<AuthState>).value;
      expect(data, isA<AuthError>());
      expect((data as AuthError).message, 'No internet');
    });
  });

  // group('AuthNotifier - verifyOtp', () {
  //   test('should_emitAuthenticated_whenOtpIsCorrect', () async {
  //     // Arrange
  //     when(mockAuthRepository.verifyOtp(
  //       email: anyNamed('email'),
  //       otp: anyNamed('otp'),
  //     )).thenAnswer((_) async => const Right(tUser));
  //
  //     // Act
  //     final notifier = container.read(authProvider.notifier);
  //     await notifier.verifyOtp(email: 'john@example.com', otp: '12345');
  //
  //     // Assert
  //     final state = container.read(authProvider);
  //     final data = (state as AsyncData<AuthState>).value;
  //     expect(data, isA<AuthAuthenticated>());
  //   });
  //
  //   test('should_emitError_whenOtpIsInvalid', () async {
  //     // Arrange
  //     when(mockAuthRepository.verifyOtp(
  //       email: anyNamed('email'),
  //       otp: anyNamed('otp'),
  //     )).thenAnswer(
  //       (_) async => const Left(ValidationFailure(message: 'Invalid OTP')),
  //     );
  //
  //     // Act
  //     final notifier = container.read(authProvider.notifier);
  //     await notifier.verifyOtp(email: 'john@example.com', otp: '99999');
  //
  //     // Assert
  //     final state = container.read(authProvider);
  //     final data = (state as AsyncData<AuthState>).value;
  //     expect(data, isA<AuthError>());
  //   });
  // });
}
