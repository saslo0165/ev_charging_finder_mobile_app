import 'package:freezed_annotation/freezed_annotation.dart';

part 'station.freezed.dart';
part 'station.g.dart';

@freezed
abstract class Station with _$Station {
  const factory Station({
    required String id,
    required String name,
    required String address,
    required double latitude,
    required double longitude,
    required double distanceKm,
    required int availableConnectors,
    required int totalConnectors,
    required double maxPowerKw,
    required String providerName,
    @Default(false) bool isFavorite,
    @Default(true) bool isWorking,
  }) = _Station;

  factory Station.fromJson(Map<String, dynamic> json) => _$StationFromJson(json);
}
