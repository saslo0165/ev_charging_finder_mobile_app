import 'package:freezed_annotation/freezed_annotation.dart';

part 'station.freezed.dart';
part 'station.g.dart';

@freezed
abstract class Station with _$Station {
  const factory Station({
    required String id,
    required String name,
    @Default('') String description,
    required String address,
    required double latitude,
    required double longitude,
    required String city,
    required String state,
    required String country,
    required List<String> connectorTypes,
    required String chargingSpeed,
    required int totalPorts,
    required int availablePorts,
    required String status,
    required double distanceKm,
    required String providerName,
    required double maxPowerKw,
    @Default(false) bool isFavorite,
    @Default(true) bool isPublic,
    @Default('public') String accessType,
    int? verifiedBy,
    String? pricingInfo,
    String? workingHours,
    @Default([]) List<String> photos,
  }) = _Station;

  factory Station.fromJson(Map<String, dynamic> json) => _$StationFromJson(json);
}
