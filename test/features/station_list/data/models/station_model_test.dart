import 'package:ev_charging_finder/features/station_list/data/models/station_model.dart';
import 'package:ev_charging_finder/features/station_list/domain/station.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tStationJson = {
    'id': 2,
    'name': 'Fast Charge',
    'description': 'Verification station.',
    'address': 'Test Road',
    'city': 'Ahmedabad',
    'state': 'Gujarat',
    'country': 'India',
    'latitude': 23.045,
    'longitude': 72.515,
    'connector_types': ['CCS2'],
    'charging_speed': 'rapid',
    'total_ports': 2,
    'available_ports': 2,
    'is_public': true,
    'access_type': 'paid',
    'verified_by': 5,
    'status': 'active',
    'pricing_info': '₹15/kWh',
    'working_hours': '24/7',
    'photos': []
  };

  final tStationModel = StationModel(
    id: 2,
    name: 'Fast Charge',
    description: 'Verification station.',
    address: 'Test Road',
    city: 'Ahmedabad',
    state: 'Gujarat',
    country: 'India',
    latitude: 23.045,
    longitude: 72.515,
    connectorTypes: ['CCS2'],
    chargingSpeed: 'rapid',
    totalPorts: 2,
    availablePorts: 2,
    isPublic: true,
    accessType: 'paid',
    verifiedBy: 5,
    status: 'active',
    pricingInfo: '₹15/kWh',
    workingHours: '24/7',
    photos: [],
  );

  group('fromJson', () {
    test('should_returnValidModel_whenJsonIsCorrect', () {
      final result = StationModel.fromJson(tStationJson);
      expect(result, tStationModel);
    });
  });

  group('toDomain', () {
    test('should_returnValidEntity_fromModel', () {
      final result = tStationModel.toDomain();
      expect(result, isA<Station>());
      expect(result.id, '2');
      expect(result.name, tStationModel.name);
      expect(result.availablePorts, tStationModel.availablePorts);
      expect(result.description, tStationModel.description);
      expect(result.isPublic, tStationModel.isPublic);
      expect(result.accessType, tStationModel.accessType);
      expect(result.verifiedBy, tStationModel.verifiedBy);
    });

    test('should_formatNameCorrectly_whenNameContainsTestPattern', () {
      const model = StationModel(
        id: 2,
        name: 'Fast Charge 1777289965',
        description: 'desc',
        address: 'addr',
        city: 'city',
        state: 'state',
        country: 'country',
        latitude: 0,
        longitude: 0,
        connectorTypes: [],
        chargingSpeed: 'fast',
        totalPorts: 1,
        availablePorts: 1,
        isPublic: true,
        accessType: 'free',
        status: 'active',
        photos: [],
      );

      final result = model.toDomain();
      
      expect(result.name, 'Fast Charge');
    });
  });
}
