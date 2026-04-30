import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ev_charging_finder/core/error/failures.dart';
import 'package:ev_charging_finder/features/auth/domain/repositories/auth_repository.dart';
import 'package:ev_charging_finder/features/auth/domain/usecases/logout_usecase.dart';

import 'logout_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockRepository;
  late LogoutUseCase useCase;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LogoutUseCase(mockRepository);
    // provide dummy for void result
    provideDummy<Either<Failure, void>>(const Right(null));
  });

  test('should_callRepositoryLogout_whenCalled', () async {
    // Arrange
    when(mockRepository.logout(token: anyNamed('token')))
        .thenAnswer((_) async => const Right(null));

    // Act
    final result = await useCase('test_token');

    // Assert
    expect(result, const Right(null));
    verify(mockRepository.logout(token: 'test_token')).called(1);
  });
}
