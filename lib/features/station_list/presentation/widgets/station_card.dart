import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/gap.dart';
import '../../domain/station.dart';
import '../../../map/domain/models/plug_data.dart';

class StationCard extends StatelessWidget {
  const StationCard({super.key, required this.station, this.onTap});
  final Station station;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
          border: Border.all(color: AppColors.border),
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
            if (station.photos.isNotEmpty) ...[
              _buildPhotoHeader(),
              Gap.h16,
            ],
            Padding(
              padding: station.photos.isEmpty 
                  ? EdgeInsets.zero 
                  : const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  Gap.h8,
                  _buildActionRow(),
                  if (station.description.isNotEmpty) ...[
                    Gap.h8,
                    _buildDescription(),
                  ],
                  Gap.h8,
                  _buildAddress(),
                  Gap.h16,
                  _buildQuickInfoRow(),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoHeader() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            station.photos.first,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              height: 160,
              width: double.infinity,
              color: const Color(0xFFF1F5F9),
              child: const Icon(Icons.image_not_supported, color: Color(0xFF94A3B8)),
            ),
          ),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: station.isPublic ? const Color(0xFF22C55E) : const Color(0xFF64748B),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              station.isPublic ? 'PUBLIC' : 'PRIVATE',
              style: AppTypography.labelSmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      station.description,
      style: AppTypography.bodySmall.copyWith(
        color: AppColors.onSurfaceVariant,
        height: 1.4,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildQuickInfoRow() {
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: [
        _QuickInfoItem(
          icon: Icons.ev_station_rounded,
          label: '${station.availablePorts}/${station.totalPorts} available',
          iconColor: station.availablePorts > 0 ? const Color(0xFF22C55E) : const Color(0xFFEF4444),
          showStatusDot: true,
        ),
        _QuickInfoItem(
          icon: station.accessType.toLowerCase() == 'paid' 
              ? Icons.currency_rupee_rounded 
              : Icons.lock_open_rounded,
          label: station.accessType.toUpperCase(),
          iconColor: const Color(0xFF64748B),
        ),
        if (station.pricingInfo != null)
          _QuickInfoItem(
            icon: Icons.currency_rupee_rounded,
            label: station.pricingInfo!,
            iconColor: const Color(0xFFF59E0B),
          ),
        if (station.workingHours != null)
          _QuickInfoItem(
            icon: Icons.access_time_rounded,
            label: station.workingHours!,
            iconColor: const Color(0xFF3B82F6),
          ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Flexible(
          child: Text(
            station.name,
            style: AppTypography.titleLarge.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (station.verifiedBy != null) ...[
          Gap.w4,
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Color(0xFFDBEAFE),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.verified, color: Color(0xFF3B82F6), size: 16),
          ),
        ],
      ],
    );
  }

  Widget _buildActionRow() {
    final bool isFast = station.chargingSpeed.toLowerCase().contains('fast');
    
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isFast 
                  ? [const Color(0xFFF0FDF4), const Color(0xFFDCFCE7)]
                  : [const Color(0xFFEFF6FF), const Color(0xFFDBEAFE)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isFast ? const Color(0xFFBBF7D0) : const Color(0xFFBFDBFE),
            ),
          ),
          child: Text(
            station.chargingSpeed.toUpperCase(),
            style: AppTypography.labelSmall.copyWith(
              color: isFast ? const Color(0xFF15803D) : const Color(0xFF1D4ED8),
              fontWeight: FontWeight.w800,
              fontSize: 10,
            ),
          ),
        ),
        const Spacer(),
        _buildActionIcon(Icons.near_me),
      ],
    );
  }

  Widget _buildActionIcon(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, color: AppColors.onSurface, size: 20),
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
          '${station.distanceKm > 0 ? station.distanceKm.toStringAsFixed(1) : "0.5"} Kms • 8 mins',
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
    final plugs = _mapConnectorsToPlugs(station.connectorTypes);
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < plugs.length; i++) ...[
            if (i > 0) Gap.w12,
            _PlugMiniCard(data: plugs[i]),
          ],
          if (plugs.isEmpty)
             Text('No plug data available', style: AppTypography.bodySmall),
        ],
      ),
    );
  }

  List<PlugData> _mapConnectorsToPlugs(List<String> types) {
    return types.map((type) {
      final isCcs2 = type.toUpperCase().contains('CCS');
      return PlugData(
        title: type.toUpperCase(),
        subtitle: isCcs2 ? 'Level-3 (Fast)' : 'Level-2 240kV',
        connectorType: isCcs2 ? 'DC' : 'AC',
        svgAsset: isCcs2 ? AppAssets.iconEvCcs2 : AppAssets.iconEvType2,
      );
    }).toList();
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

class _QuickInfoItem extends StatelessWidget {
  const _QuickInfoItem({
    required this.icon,
    required this.label,
    this.iconColor,
    this.showStatusDot = false,
  });
  
  final IconData icon;
  final String label;
  final Color? iconColor;
  final bool showStatusDot;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showStatusDot) ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: iconColor ?? const Color(0xFF64748B),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: (iconColor ?? const Color(0xFF64748B)).withValues(alpha: 0.4),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
            Gap.w4,
          ] else ...[
            Icon(icon, size: 14, color: iconColor ?? const Color(0xFF64748B)),
            Gap.w4,
          ],
          Flexible(
            child: Text(
              label,
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.onSurface,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
