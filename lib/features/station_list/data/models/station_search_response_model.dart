import 'package:freezed_annotation/freezed_annotation.dart';
import 'station_model.dart';

import '../../domain/station_search_response.dart';

part 'station_search_response_model.freezed.dart';
part 'station_search_response_model.g.dart';

@freezed
abstract class StationSearchResponseModel with _$StationSearchResponseModel {
  const factory StationSearchResponseModel({
    required int total,
    required int page,
    @JsonKey(name: 'page_size') required int pageSize,
    required List<StationModel> stations,
  }) = _StationSearchResponseModel;

  factory StationSearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StationSearchResponseModelFromJson(json);

  const StationSearchResponseModel._();

  StationSearchResponse toDomain() {
    return StationSearchResponse(
      total: total,
      page: page,
      pageSize: pageSize,
      stations: stations.map((m) => m.toDomain()).toList(),
    );
  }
}
