// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Station _$StationFromJson(Map<String, dynamic> json) => _Station(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  distanceKm: (json['distanceKm'] as num).toDouble(),
  availableConnectors: (json['availableConnectors'] as num).toInt(),
  totalConnectors: (json['totalConnectors'] as num).toInt(),
  maxPowerKw: (json['maxPowerKw'] as num).toDouble(),
  providerName: json['providerName'] as String,
  isFavorite: json['isFavorite'] as bool? ?? false,
  isWorking: json['isWorking'] as bool? ?? true,
);

Map<String, dynamic> _$StationToJson(_Station instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'distanceKm': instance.distanceKm,
  'availableConnectors': instance.availableConnectors,
  'totalConnectors': instance.totalConnectors,
  'maxPowerKw': instance.maxPowerKw,
  'providerName': instance.providerName,
  'isFavorite': instance.isFavorite,
  'isWorking': instance.isWorking,
};
