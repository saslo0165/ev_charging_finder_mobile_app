import 'package:ev_charging_finder/features/station_list/domain/station_repository.dart';
import 'package:ev_charging_finder/features/station_list/domain/station_search_response.dart';
import 'package:ev_charging_finder/features/station_list/domain/usecases/search_stations_usecase.dart';
import 'package:ev_charging_finder/core/error/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_stations_usecase_test.mocks.dart';

@GenerateMocks([StationRepository])
void main() {
  late MockStationRepository mockRepository;
  late SearchStationsUseCase useCase;

  setUp(() {
    mockRepository = MockStationRepository();
    useCase = SearchStationsUseCase(mockRepository);
    provideDummy<Either<Failure, StationSearchResponse>>(
      const Right(StationSearchResponse(total: 0, page: 1, pageSize: 10, stations: [])),
    );
  });

  const tSearchResponse = StationSearchResponse(
    total: 1,
    page: 1,
    pageSize: 10,
    stations: [],
  );

  const tParams = SearchStationsParams(query: 'test');

  test('should_returnSearchResponse_whenRepositorySucceeds', () async {
    // Arrange
    when(mockRepository.searchStations(
      query: anyNamed('query'),
      city: anyNamed('city'),
      page: anyNamed('page'),
      pageSize: anyNamed('pageSize'),
    )).thenAnswer((_) async => const Right(tSearchResponse));

    // Act
    final result = await useCase(tParams);

    // Assert
    expect(result, const Right(tSearchResponse));
    verify(mockRepository.searchStations(
      query: 'test',
      city: null,
      page: 1,
      pageSize: 10,
    )).called(1);
  });
}
