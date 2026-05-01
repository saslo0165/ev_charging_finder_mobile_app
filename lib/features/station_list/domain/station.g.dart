// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Station _$StationFromJson(Map<String, dynamic> json) => _Station(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String? ?? '',
  address: json['address'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  city: json['city'] as String,
  state: json['state'] as String,
  country: json['country'] as String,
  connectorTypes: (json['connectorTypes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  chargingSpeed: json['chargingSpeed'] as String,
  totalPorts: (json['totalPorts'] as num).toInt(),
  availablePorts: (json['availablePorts'] as num).toInt(),
  status: json['status'] as String,
  distanceKm: (json['distanceKm'] as num).toDouble(),
  providerName: json['providerName'] as String,
  maxPowerKw: (json['maxPowerKw'] as num).toDouble(),
  isFavorite: json['isFavorite'] as bool? ?? false,
  isPublic: json['isPublic'] as bool? ?? true,
  accessType: json['accessType'] as String? ?? 'public',
  verifiedBy: (json['verifiedBy'] as num?)?.toInt(),
  pricingInfo: json['pricingInfo'] as String?,
  workingHours: json['workingHours'] as String?,
  photos:
      (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$StationToJson(_Station instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'city': instance.city,
  'state': instance.state,
  'country': instance.country,
  'connectorTypes': instance.connectorTypes,
  'chargingSpeed': instance.chargingSpeed,
  'totalPorts': instance.totalPorts,
  'availablePorts': instance.availablePorts,
  'status': instance.status,
  'distanceKm': instance.distanceKm,
  'providerName': instance.providerName,
  'maxPowerKw': instance.maxPowerKw,
  'isFavorite': instance.isFavorite,
  'isPublic': instance.isPublic,
  'accessType': instance.accessType,
  'verifiedBy': instance.verifiedBy,
  'pricingInfo': instance.pricingInfo,
  'workingHours': instance.workingHours,
  'photos': instance.photos,
};
