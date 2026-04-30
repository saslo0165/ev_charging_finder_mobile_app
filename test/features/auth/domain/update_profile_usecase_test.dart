import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ev_charging_finder/features/auth/domain/repositories/auth_repository.dart';
import 'package:ev_charging_finder/features/auth/domain/usecases/update_profile_usecase.dart';
import 'package:ev_charging_finder/features/auth/domain/entities/user_entity.dart';
import 'package:ev_charging_finder/core/error/failures.dart';

import 'update_profile_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockRepository;
  late UpdateProfileUseCase useCase;

  final tUserEntity = UserEntity(
    id: 1,
    fullName: 'Shasank',
    email: 'shasank@gmail.com',
    phone: '9824550909',
    avatarUrl: null,
    isGuest: false,
    isActive: true,
    role: 'user',
    createdAt: DateTime.now(),
  );

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = UpdateProfileUseCase(mockRepository);
    // fpdart Either is not auto-inferred by Mockito — provide a dummy value.
    provideDummy<Either<Failure, UserEntity>>(Right(tUserEntity));
  });

  test('should_returnUserEntity_whenRepositorySucceeds', () async {
    // Arrange
    when(mockRepository.updateProfile(
      token: anyNamed('token'),
      fullName: anyNamed('fullName'),
      phone: anyNamed('phone'),
    )).thenAnswer((_) async => Right(tUserEntity));

    // Act
    final result = await useCase(const UpdateProfileParams(
      token: 'test_token',
      fullName: 'Shasank',
      phone: '9824550909',
    ));

    // Assert
    expect(result, Right(tUserEntity));
    verify(mockRepository.updateProfile(
      token: 'test_token',
      fullName: 'Shasank',
      phone: '9824550909',
    )).called(1);
  });
}
