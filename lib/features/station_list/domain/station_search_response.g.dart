// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StationSearchResponse _$StationSearchResponseFromJson(
  Map<String, dynamic> json,
) => _StationSearchResponse(
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  pageSize: (json['pageSize'] as num).toInt(),
  stations: (json['stations'] as List<dynamic>)
      .map((e) => Station.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StationSearchResponseToJson(
  _StationSearchResponse instance,
) => <String, dynamic>{
  'total': instance.total,
  'page': instance.page,
  'pageSize': instance.pageSize,
  'stations': instance.stations,
};
