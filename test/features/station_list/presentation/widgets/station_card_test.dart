import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ev_charging_finder/features/station_list/domain/station.dart';
import 'package:ev_charging_finder/features/station_list/presentation/widgets/station_card.dart';

void main() {
  const tStation = Station(
    id: '2',
    name: 'Tata Power EZ Charge',
    description: 'Premium ultra-fast charging hub.',
    address: 'G Block, BKC, Mumbai',
    city: 'Mumbai',
    state: 'Maharashtra',
    country: 'India',
    latitude: 19.0596,
    longitude: 72.8631,
    connectorTypes: ['ccs2', 'chademo'],
    chargingSpeed: 'rapid',
    totalPorts: 6,
    availablePorts: 4,
    isPublic: true,
    status: 'active',
    distanceKm: 2.5,
    providerName: 'Tata Power',
    maxPowerKw: 60.0,
    pricingInfo: '₹18/kWh',
    workingHours: 'Open 24 Hours',
    accessType: 'paid',
    verifiedBy: 1,
    photos: ['https://example.com/photo.jpg'],
  );

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            StationCard(station: tStation),
          ],
        ),
      ),
    );
  }

  testWidgets('should_displayAllStationDetails_whenStationProvided', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Tata Power EZ Charge'), findsOneWidget);
    expect(find.text('Premium ultra-fast charging hub.'), findsOneWidget);
    expect(find.textContaining('BKC, Mumbai'), findsOneWidget);
    expect(find.text('₹18/kWh'), findsOneWidget);
    expect(find.text('Open 24 Hours'), findsOneWidget);
    expect(find.text('4/6 available'), findsOneWidget);
    expect(find.text('PUBLIC'), findsOneWidget);
    expect(find.text('PAID'), findsOneWidget);
    expect(find.byIcon(Icons.verified), findsOneWidget);
  });
}
