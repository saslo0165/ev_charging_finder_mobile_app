import 'package:ev_charging_finder/features/station_list/domain/station.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/gap.dart';
import '../../../../core/widgets/hub_app_bar.dart';
import '../../map/domain/models/plug_data.dart';

// Mock data based on the screenshot
final List<Station> kSavedStations = [
  const Station(
    id: '1',
    name: 'EV Charging Sarkhej',
    address: 'Near 701, Sarkhej - Gandhinagar highway beside Iskon Gathiya shop...',
    latitude: 23.0225,
    longitude: 72.5714,
    distanceKm: 10.0,
    availableConnectors: 2,
    totalConnectors: 4,
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
    distanceKm: 10.0,
    availableConnectors: 2,
    totalConnectors: 4,
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
        itemBuilder: (context, index) => SavedStationCard(station: kSavedStations[index]),
      ),
    );
  }
}

class SavedStationCard extends StatelessWidget {
  const SavedStationCard({super.key, required this.station});
  final Station station;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          Gap.h8,
          _buildAddress(),
          Gap.h16,
          _buildStatsRow(),
          const Divider(height: 32, color: Color(0xFFF1F5F9)),
          Text('Plugs available', style: AppTypography.headlineLarge.copyWith(fontSize: 14)),
          Gap.h12,
          _buildPlugList(),
          Gap.h20,
          Text('Nearby Amenities', style: AppTypography.headlineLarge.copyWith(fontSize: 14)),
          Gap.h12,
          _buildAmenitiesRow(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            station.name,
            style: AppTypography.titleLarge.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF0FDF4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.near_me, color: Colors.black, size: 20),
        ),
      ],
    );
  }

  Widget _buildAddress() {
    return Text(
      station.address,
      style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Text(
          '${station.distanceKm.toInt()} Kms • 8 mins',
          style: AppTypography.headlineLarge.copyWith(fontSize: 14, color: AppColors.onSurfaceVariant),
        ),
        const Spacer(),
        _buildRatingStars(4.5),
      ],
    );
  }

  Widget _buildRatingStars(double rating) {
    return Row(
      children: [
        ...List.generate(4, (_) => const Icon(Icons.star, color: Color(0xFFFFC107), size: 18)),
        const Icon(Icons.star_half, color: Color(0xFFFFC107), size: 18),
        Gap.w4,
        Text(
          rating.toString(),
          style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildPlugList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < kMockPlugs.length; i++) ...[
            if (i > 0) Gap.w12,
            _PlugMiniCard(data: kMockPlugs[i]),
          ],
        ],
      ),
    );
  }

  Widget _buildAmenitiesRow() {
    const amenities = [Icons.wc, Icons.local_parking, Icons.restaurant];
    return Row(
      children: [
        for (int i = 0; i < amenities.length; i++) ...[
          if (i > 0) Gap.w16,
          _AmenityIcon(icon: amenities[i]),
        ],
      ],
    );
  }
}

class _PlugMiniCard extends StatelessWidget {
  const _PlugMiniCard({required this.data});
  final PlugData data;

  @override
  Widget build(BuildContext context) {
    final isDisabled = data.isDisabled;

    return Container(
      width: 130,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(data.svgAsset, width: 22, height: 22),
                const Spacer(),
              ],
            ),
            Gap.h8,
            Text(
              data.title,
              style: AppTypography.headlineLarge.copyWith(
                fontSize: 13,
                color: isDisabled ? Colors.grey : AppColors.primary,
              ),
            ),
            Text(
              data.subtitle,
              style: AppTypography.labelSmall.copyWith(fontSize: 10),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              data.connectorType,
              style: AppTypography.bodyMedium.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AmenityIcon extends StatelessWidget {
  const _AmenityIcon({required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Icon(icon, color: const Color(0xFF94A3B8), size: 18),
    );
  }
}
