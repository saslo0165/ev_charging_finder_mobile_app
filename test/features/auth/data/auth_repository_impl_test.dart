import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ev_charging_finder/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ev_charging_finder/features/auth/data/models/user_model.dart';
import 'package:ev_charging_finder/features/auth/data/repositories/auth_repository_impl.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  late MockAuthRemoteDataSource mockDataSource;
  late AuthRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockAuthRemoteDataSource();
    repository = AuthRepositoryImpl(mockDataSource);
  });

  final tCreatedAt = DateTime.parse('2026-04-29T12:21:19.067902+05:30');
  final tUserModel = UserModel(
    id: 6,
    fullName: 'Shashank',
    email: 'shashank@gmail.com',
    phone: '1234567890',
    avatarUrl: null,
    isGuest: false,
    isActive: true,
    role: 'user',
    createdAt: tCreatedAt,
  );

  final tUserEntity = tUserModel.toDomain();

  group('register', () {
    test('should_returnUserEntity_whenDataSourceSucceeds', () async {
      // Arrange
      when(mockDataSource.register(
        email: anyNamed('email'),
        fullName: anyNamed('fullName'),
        isGuest: anyNamed('isGuest'),
        password: anyNamed('password'),
        phone: anyNamed('phone'),
        role: anyNamed('role'),
      )).thenAnswer((_) async => tUserModel);

      // Act
      final result = await repository.register(
        email: 'shashank@gmail.com',
        fullName: 'Shashank',
        isGuest: false,
        password: 'password123',
        phone: '1234567890',
        role: 'user',
      );

      // Assert
      expect(result, Right(tUserEntity));
      verify(mockDataSource.register(
        email: 'shashank@gmail.com',
        fullName: 'Shashank',
        isGuest: false,
        password: 'password123',
        phone: '1234567890',
        role: 'user',
      )).called(1);
    });
  });

  group('updateProfile', () {
    test('should_returnUserEntity_whenDataSourceSucceeds', () async {
      // Arrange
      final updatedUserModel = tUserModel.copyWith(fullName: 'New Name', phone: '9876543210');
      final updatedUserEntity = updatedUserModel.toDomain();
      
      when(mockDataSource.updateProfile(
        token: anyNamed('token'),
        fullName: anyNamed('fullName'),
        phone: anyNamed('phone'),
      )).thenAnswer((_) async => updatedUserModel);

      // Act
      final result = await repository.updateProfile(
        token: 'test_token',
        fullName: 'New Name',
        phone: '9876543210',
      );

      // Assert
      expect(result, Right(updatedUserEntity));
      verify(mockDataSource.updateProfile(
        token: 'test_token',
        fullName: 'New Name',
        phone: '9876543210',
      )).called(1);
    });
  });

  group('logout', () {
    test('should_returnRight_whenDataSourceSucceeds', () async {
      // Arrange
      when(mockDataSource.logout(token: anyNamed('token')))
          .thenAnswer((_) async => Future.value());

      // Act
      final result = await repository.logout(token: 'test_token');

      // Assert
      expect(result, const Right(null));
      verify(mockDataSource.logout(token: 'test_token')).called(1);
    });
  });
}
