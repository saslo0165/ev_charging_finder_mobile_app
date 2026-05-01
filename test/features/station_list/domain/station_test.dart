import 'package:flutter_test/flutter_test.dart';
import 'package:ev_charging_finder/features/station_list/domain/station.dart';

void main() {
  group('Station Entity', () {
    test('should_supportNewFieldsFromSpec', () {
      const station = Station(
        id: '2',
        name: 'Fast Charge',
        description: 'Premium ultra-fast charging hub.',
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
        status: 'active',
        isPublic: true,
        accessType: 'paid',
        verifiedBy: 5,
        distanceKm: 0.0,
        providerName: 'Test Provider',
        maxPowerKw: 50.0,
      );

      expect(station.city, 'Ahmedabad');
      expect(station.chargingSpeed, 'rapid');
      expect(station.availablePorts, 2);
      expect(station.description, 'Premium ultra-fast charging hub.');
      expect(station.isPublic, true);
      expect(station.accessType, 'paid');
      expect(station.verifiedBy, 5);
    });
  });
}
