import 'package:ev_charging_finder/core/error/failures.dart';
import 'package:ev_charging_finder/features/station_list/data/datasources/station_remote_datasource.dart';
import 'package:ev_charging_finder/features/station_list/data/models/station_model.dart';
import 'package:ev_charging_finder/features/station_list/data/models/station_search_response_model.dart';
import 'package:ev_charging_finder/features/station_list/data/repositories/station_repository_impl.dart';
import 'package:ev_charging_finder/features/station_list/domain/station_search_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'station_repository_impl_test.mocks.dart';

@GenerateMocks([StationRemoteDataSource])
void main() {
  late MockStationRemoteDataSource mockRemoteDataSource;
  late StationRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockStationRemoteDataSource();
    repository = StationRepositoryImpl(mockRemoteDataSource);
  });

  const tStationModel = StationModel(
    id: 2,
    name: 'Fast Charge',
    description: 'Verification station.',
    address: 'Test Road',
    city: 'Ahmedabad',
    state: 'Gujarat',
    country: 'India',
    latitude: 23.045,
    longitude: 72.515,
    connectorTypes: ['CCS2'],
    chargingSpeed: 'rapid',
    totalPorts: 2,
    availablePorts: 2,
    status: 'active',
    photos: [],
  );

  const tResponseModel = StationSearchResponseModel(
    total: 1,
    page: 1,
    pageSize: 10,
    stations: [tStationModel],
  );

  group('searchStations', () {
    test('should_returnRightSearchResponse_whenRemoteDataSourceSucceeds', () async {
      // Arrange
      when(mockRemoteDataSource.searchStations(
        query: anyNamed('query'),
        city: anyNamed('city'),
        page: anyNamed('page'),
        pageSize: anyNamed('pageSize'),
      )).thenAnswer((_) async => tResponseModel);

      // Act
      final result = await repository.searchStations(query: 'test');

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Should not return left'),
        (r) {
          expect(r, isA<StationSearchResponse>());
          expect(r.total, 1);
          expect(r.stations.first.id, '2');
        },
      );
    });

    test('should_returnLeftFailure_whenRemoteDataSourceThrows', () async {
      // Arrange
      when(mockRemoteDataSource.searchStations(
        query: anyNamed('query'),
        city: anyNamed('city'),
        page: anyNamed('page'),
        pageSize: anyNamed('pageSize'),
      )).thenThrow(const UnknownFailure(message: 'Error'));

      // Act
      final result = await repository.searchStations(query: 'test');

      // Assert
      expect(result.isLeft(), true);
      expect(result.getLeft().getOrElse(() => const UnknownFailure(message: 'error')), isA<UnknownFailure>());
    });
  });
}
