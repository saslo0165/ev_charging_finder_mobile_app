import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../models/station_search_response_model.dart';

abstract interface class StationRemoteDataSource {
  Future<StationSearchResponseModel> searchStations({
    required String query,
    String? city,
    int page = 1,
    int pageSize = 10,
  });
}

class StationRemoteDataSourceImpl implements StationRemoteDataSource {
  final Dio _dio;

  StationRemoteDataSourceImpl(this._dio);

  @override
  Future<StationSearchResponseModel> searchStations({
    required String query,
    String? city,
    int page = 1,
    int pageSize = 10,
  }) async {
    final response = await _dio.get(
      '/stations/search',
      queryParameters: {
        'q': query,
        'city': city,
        'page': page,
        'page_size': pageSize,
      },
    );

    debugPrint('🚀 API REQUEST: GET /stations/search');
    debugPrint('📝 PARAMS: {q: $query, city: $city, page: $page, page_size: $pageSize}');
    debugPrint('📥 RESPONSE [${response.statusCode}]: ${response.data}');

    if (response.data == null) {
      throw Exception('No data returned from server');
    }

    return StationSearchResponseModel.fromJson(Map<String, dynamic>.from(response.data));
  }
}
