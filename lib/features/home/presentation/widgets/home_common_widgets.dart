import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../core/constants/app_dimensions.dart';

/// Yellow alert strip shown when device location is not granted.
class LocationAlertBanner extends StatelessWidget {
  const LocationAlertBanner({super.key, required this.onEnable});

  final VoidCallback onEnable;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        AppDimensions.pageHorizontalPadding,
        12,
        AppDimensions.pageHorizontalPadding,
        0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.chipRadius),
        border: Border.all(color: AppColors.outline),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_off_outlined,
            color: AppColors.onSurfaceVariant,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Device location is not enabled',
              style: context.bodyMedium.copyWith(fontSize: 14),
            ),
          ),
          _EnableLocationButton(onPressed: onEnable),
        ],
      ),
    );
  }
}

/// Compact CTA button used inside [LocationAlertBanner].
class _EnableLocationButton extends StatelessWidget {
  const _EnableLocationButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        minimumSize: Size.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        'Enable',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}

/// Title + subtitle heading used above content sections.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: context.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
        ),
      ],
    );
  }
}
