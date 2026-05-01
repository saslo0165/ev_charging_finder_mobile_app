import 'package:dio/dio.dart';
import 'package:ev_charging_finder/features/station_list/data/datasources/station_remote_datasource.dart';
import 'package:ev_charging_finder/features/station_list/data/models/station_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'station_remote_datasource_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late StationRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = StationRemoteDataSourceImpl(mockDio);
  });

  const tResponse = {
    "total": 1,
    "page": 1,
    "page_size": 10,
    "stations": [
      {
        "id": 2,
        "name": "Fast Charge",
        "description": "Verification station.",
        "address": "Test Road",
        "city": "Ahmedabad",
        "state": "Gujarat",
        "country": "India",
        "latitude": 23.045,
        "longitude": 72.515,
        "connector_types": ["CCS2"],
        "charging_speed": "rapid",
        "total_ports": 2,
        "available_ports": 2,
        "status": "active",
        "pricing_info": "₹15/kWh",
        "working_hours": "24/7",
        "photos": []
      }
    ]
  };

  group('searchStations', () {
    test('should_performGetRequest_toCorrectEndpointWithQueryParams', () async {
      // Arrange
      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => Response(
            data: tResponse,
            statusCode: 200,
            requestOptions: RequestOptions(path: '/stations/search'),
          ));

      // Act
      final result = await dataSource.searchStations(
        query: 'test',
        city: 'Ahmedabad',
        page: 1,
        pageSize: 10,
      );
      print('DEBUG: Station Name: ${result.stations.first.name}');

      // Assert
      expect(result.stations.length, 1);
      expect(result.stations.first, isA<StationModel>());
      verify(mockDio.get(
        '/stations/search',
        queryParameters: {
          'q': 'test',
          'city': 'Ahmedabad',
          'page': 1,
          'page_size': 10,
        },
      )).called(1);
    });
  });
}
