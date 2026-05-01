import 'package:freezed_annotation/freezed_annotation.dart';
import 'station.dart';

part 'station_search_response.freezed.dart';
part 'station_search_response.g.dart';

@freezed
abstract class StationSearchResponse with _$StationSearchResponse {
  const factory StationSearchResponse({
    required int total,
    required int page,
    required int pageSize,
    required List<Station> stations,
  }) = _StationSearchResponse;

  factory StationSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$StationSearchResponseFromJson(json);
}
