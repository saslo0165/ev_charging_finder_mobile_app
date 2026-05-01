// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StationSearchResponseModel _$StationSearchResponseModelFromJson(
  Map<String, dynamic> json,
) => _StationSearchResponseModel(
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  pageSize: (json['page_size'] as num).toInt(),
  stations: (json['stations'] as List<dynamic>)
      .map((e) => StationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StationSearchResponseModelToJson(
  _StationSearchResponseModel instance,
) => <String, dynamic>{
  'total': instance.total,
  'page': instance.page,
  'page_size': instance.pageSize,
  'stations': instance.stations,
};
