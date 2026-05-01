import 'package:ev_charging_finder/features/station_list/domain/station.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/gap.dart';
import '../../../../core/widgets/hub_app_bar.dart';
import '../../map/domain/models/plug_data.dart';
import '../../station_list/presentation/widgets/station_card.dart';

// Mock data based on the screenshot
final List<Station> kSavedStations = [
  const Station(
    id: '1',
    name: 'EV Charging Sarkhej',
    address: 'Near 701, Sarkhej - Gandhinagar highway beside Iskon Gathiya shop...',
    latitude: 23.0225,
    longitude: 72.5714,
    city: 'Ahmedabad',
    state: 'Gujarat',
    country: 'India',
    connectorTypes: ['CCS2', 'Type 2'],
    chargingSpeed: 'rapid',
    totalPorts: 4,
    availablePorts: 2,
    status: 'active',
    distanceKm: 10.0,
    maxPowerKw: 240,
    providerName: 'ChargeHub',
    isFavorite: true,
  ),
  const Station(
    id: '2',
    name: 'EV Charging Sarkhej',
    address: 'Near 701, Sarkhej - Gandhinagar highway beside Iskon Gathiya shop...',
    latitude: 23.0225,
    longitude: 72.5714,
    city: 'Ahmedabad',
    state: 'Gujarat',
    country: 'India',
    connectorTypes: ['CCS2', 'Type 2'],
    chargingSpeed: 'rapid',
    totalPorts: 4,
    availablePorts: 2,
    status: 'active',
    distanceKm: 10.0,
    maxPowerKw: 240,
    providerName: 'ChargeHub',
    isFavorite: true,
  ),
];

const List<PlugData> kMockPlugs = [
  PlugData(
    title: 'Type 2',
    subtitle: 'Level-2 240kV',
    connectorType: 'AC/DC',
    svgAsset: AppAssets.iconEvType2,
  ),
  PlugData(
    title: 'CCS 2',
    subtitle: 'Level-3 (Fast)',
    connectorType: 'DC',
    svgAsset: AppAssets.iconEvCcs2,
  ),
  PlugData(
    title: 'Type 2',
    subtitle: 'Level-1',
    connectorType: 'AC',
    svgAsset: AppAssets.iconEvType2,
    isDisabled: true,
  ),
];

class SavedStationsScreen extends StatelessWidget {
  const SavedStationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2), // Light grey background as in design
      appBar: HubAppBar(
        title: 'Saved Stations',
        showBackButton: true,
        backIcon: Icons.arrow_back,
        titleStyle: AppTypography.titleLarge.copyWith(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: AppColors.onSurface,
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppDimensions.pageHorizontalPadding),
        itemCount: kSavedStations.length,
        separatorBuilder: (context, index) => Gap.h16,
        itemBuilder: (context, index) => StationCard(station: kSavedStations[index]),
      ),
    );
  }
}

