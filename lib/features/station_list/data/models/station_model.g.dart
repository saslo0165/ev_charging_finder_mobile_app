// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StationModel _$StationModelFromJson(Map<String, dynamic> json) =>
    _StationModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      connectorTypes: (json['connector_types'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      chargingSpeed: json['charging_speed'] as String,
      totalPorts: (json['total_ports'] as num).toInt(),
      availablePorts: (json['available_ports'] as num).toInt(),
      isPublic: json['is_public'] as bool,
      accessType: json['access_type'] as String,
      verifiedBy: (json['verified_by'] as num?)?.toInt(),
      status: json['status'] as String,
      pricingInfo: json['pricing_info'] as String?,
      workingHours: json['working_hours'] as String?,
      photos: (json['photos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$StationModelToJson(_StationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'connector_types': instance.connectorTypes,
      'charging_speed': instance.chargingSpeed,
      'total_ports': instance.totalPorts,
      'available_ports': instance.availablePorts,
      'is_public': instance.isPublic,
      'access_type': instance.accessType,
      'verified_by': instance.verifiedBy,
      'status': instance.status,
      'pricing_info': instance.pricingInfo,
      'working_hours': instance.workingHours,
      'photos': instance.photos,
    };
