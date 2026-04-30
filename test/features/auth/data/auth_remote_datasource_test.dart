import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ev_charging_finder/features/auth/data/datasources/auth_remote_datasource.dart';

import 'auth_remote_datasource_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late AuthRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = AuthRemoteDataSourceImpl(mockDio);
  });

  const tResponse = {
    "id": 6,
    "full_name": "Shashank",
    "email": "shashank@gmail.com",
    "phone": "1234567890",
    "avatar_url": null,
    "is_guest": false,
    "is_active": true,
    "role": "user",
    "created_at": "2026-04-29T12:21:19.067902+05:30"
  };

  group('register', () {
    test('should_performPostRequest_withCorrectBody', () async {
      // Arrange
      when(mockDio.post(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
            data: tResponse,
            statusCode: 201,
            requestOptions: RequestOptions(path: '/auth/register'),
          ));

      // Act
      await dataSource.register(
        email: 'shashank@gmail.com',
        fullName: 'Shashank',
        isGuest: false,
        password: 'password123',
        phone: '1234567890',
        role: 'user',
      );

      // Assert
      verify(mockDio.post(
        '/auth/register',
        data: {
          'email': 'shashank@gmail.com',
          'full_name': 'Shashank',
          'is_guest': false,
          'password': 'password123',
          'phone': '1234567890',
          'role': 'user',
        },
      )).called(1);
    });
  });

  group('updateProfile', () {
    test('should_performPutRequest_withCorrectBody', () async {
      // Arrange
      const tUpdateBody = {
        'full_name': 'New Name',
        'phone': '9876543210',
      };
      when(mockDio.put(
        any,
        data: anyNamed('data'),
        options: anyNamed('options'),
      )).thenAnswer((_) async => Response(
            data: tResponse,
            statusCode: 200,
            requestOptions: RequestOptions(path: '/auth/me'),
          ));

      // Act
      await dataSource.updateProfile(
        token: 'test_token',
        fullName: 'New Name',
        phone: '9876543210',
      );

      // Assert
      verify(mockDio.put(
        '/auth/me',
        data: tUpdateBody,
        options: argThat(
          predicate<Options>((opts) => opts.headers?['Authorization'] == 'Bearer test_token'),
          named: 'options',
        ),
      )).called(1);
    });
  });

  group('logout', () {
    test('should_performPostRequest_toLogoutEndpoint', () async {
      // Arrange
      when(mockDio.post(
        any,
        options: anyNamed('options'),
      )).thenAnswer((_) async => Response(
            data: {'message': 'Logged out'},
            statusCode: 200,
            requestOptions: RequestOptions(path: '/auth/logout'),
          ));

      // Act
      await dataSource.logout(token: 'test_token');

      // Assert
      verify(mockDio.post(
        '/auth/logout',
        options: argThat(
          predicate<Options>((opts) => opts.headers?['Authorization'] == 'Bearer test_token'),
          named: 'options',
        ),
      )).called(1);
    });
  });
}
