import 'package:ev_charging_finder/features/station_list/domain/station_search_response.dart';
import 'package:ev_charging_finder/features/station_list/domain/usecases/search_stations_usecase.dart';
import 'package:ev_charging_finder/features/station_list/presentation/providers/station_search_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ev_charging_finder/features/station_list/presentation/providers/station_providers.dart';

import 'package:ev_charging_finder/core/error/failures.dart';

import 'station_search_notifier_test.mocks.dart';

@GenerateMocks([SearchStationsUseCase])
void main() {
  provideDummy<Either<Failure, StationSearchResponse>>(
    const Left(UnknownFailure(message: 'dummy')),
  );
  late MockSearchStationsUseCase mockUseCase;
  late ProviderContainer container;

  setUp(() {
    mockUseCase = MockSearchStationsUseCase();
    container = ProviderContainer(
      overrides: [
        searchStationsUseCaseProvider.overrideWithValue(mockUseCase),
      ],
    );
  });

  const tSearchResponse = StationSearchResponse(
    total: 0,
    page: 1,
    pageSize: 10,
    stations: [],
  );

  test('should_emitLoadingAndThenData_whenSearchSucceeds', () async {
    // Arrange
    when(mockUseCase(any)).thenAnswer((_) async => const Right(tSearchResponse));
    
    final notifier = container.read(stationSearchProvider.notifier);

    // Act
    await notifier.search('test');

    // Assert
    expect(container.read(stationSearchProvider), const AsyncData<StationSearchResponse?>(tSearchResponse));
    verify(mockUseCase(any)).called(1);
  });
}
