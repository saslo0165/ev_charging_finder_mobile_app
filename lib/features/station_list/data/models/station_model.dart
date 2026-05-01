import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/station.dart';

part 'station_model.freezed.dart';
part 'station_model.g.dart';

@freezed
abstract class StationModel with _$StationModel {
  const factory StationModel({
    required int id,
    required String name,
    required String description,
    required String address,
    required String city,
    required String state,
    required String country,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'connector_types') required List<String> connectorTypes,
    @JsonKey(name: 'charging_speed') required String chargingSpeed,
    @JsonKey(name: 'total_ports') required int totalPorts,
    @JsonKey(name: 'available_ports') required int availablePorts,
    @JsonKey(name: 'is_public') required bool isPublic,
    @JsonKey(name: 'access_type') required String accessType,
    @JsonKey(name: 'verified_by') int? verifiedBy,
    required String status,
    @JsonKey(name: 'pricing_info') String? pricingInfo,
    @JsonKey(name: 'working_hours') String? workingHours,
    required List<String> photos,
  }) = _StationModel;

  factory StationModel.fromJson(Map<String, dynamic> json) =>
      _$StationModelFromJson(json);

  const StationModel._();

  Station toDomain() {
    // Cleanup name: "Fast Charge 1777289965" -> "Fast Charge"
    String cleanedName = name;
    final regex = RegExp(r'\s\d+$');
    if (regex.hasMatch(name)) {
      cleanedName = name.replaceAll(regex, '').trim();
    }

    return Station(
      id: id.toString(),
      name: cleanedName,
      description: description,
      address: address,
      latitude: latitude,
      longitude: longitude,
      city: city,
      state: state,
      country: country,
      connectorTypes: connectorTypes,
      chargingSpeed: chargingSpeed,
      totalPorts: totalPorts,
      availablePorts: availablePorts,
      isPublic: isPublic,
      accessType: accessType,
      verifiedBy: verifiedBy,
      status: status,
      distanceKm: 0.0,
      providerName: 'Unknown',
      maxPowerKw: 0.0,
      isFavorite: false,
      pricingInfo: pricingInfo,
      workingHours: workingHours,
      photos: photos,
    );
  }
}
