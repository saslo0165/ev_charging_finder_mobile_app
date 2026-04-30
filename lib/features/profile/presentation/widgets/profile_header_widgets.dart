import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_dimensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ev_charging_finder/features/home/presentation/controllers/home_controller.dart';

// ── Quick-action model ─────────────────────────────────────────────────────────

class _QuickAction {
  const _QuickAction({required this.svgAsset, required this.label});
  final String svgAsset;
  final String label;
}

const _kQuickActions = [
  _QuickAction(svgAsset: AppAssets.iconWallet,  label: 'My wallet'),
  _QuickAction(svgAsset: AppAssets.iconVehicle, label: 'My Vehicle'),
  _QuickAction(svgAsset: AppAssets.iconBooking, label: 'Bookings'),
];

// ── Avatar section ─────────────────────────────────────────────────────────────

/// Circular avatar with an overlaid green camera-badge for photo editing.
class ProfileAvatarSection extends StatelessWidget {
  const ProfileAvatarSection({
    super.key,
    required this.name,
    required this.phone,
  });

  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AvatarWithBadge(),
        const SizedBox(height: 14),
        Text(
          name,
          style: context.headlineLarge.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          phone,
          style: context.bodyMedium.copyWith(
            fontSize: 13,
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _AvatarWithBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Outer glow ring
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.navSelected.withValues(alpha: 0.10),
          ),
        ),
        // Avatar circle
        Positioned(
          top: 4,
          left: 4,
          child: Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surfaceContainerHighest,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x18000000),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.person,
              size: 44,
              color: AppColors.hint,
            ),
          ),
        ),
        // Camera badge
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.navSelected,
              border: Border.all(color: Colors.white, width: 2.5),
            ),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 14,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Quick-action cards row ─────────────────────────────────────────────────────

/// Three tappable icon+label cards in a horizontal row.
class ProfileQuickActions extends ConsumerWidget {
  const ProfileQuickActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        for (int i = 0; i < _kQuickActions.length; i++) ...[
          if (i > 0) const SizedBox(width: 12),
          Expanded(child: _QuickActionCard(action: _kQuickActions[i])),
        ],
      ],
    );
  }
}

class _QuickActionCard extends ConsumerWidget {
  const _QuickActionCard({required this.action});
  final _QuickAction action;

  void _handleTap(BuildContext context, WidgetRef ref) {
    if (action.label == 'Bookings') {
      ref.read(homeControllerProvider.notifier).setSelectedIndex(2);
    } else if (action.label == 'My Vehicle') {
      ref.read(homeControllerProvider.notifier).setSelectedIndex(1);
    } else if (action.label == 'My wallet') {
      // Wallet feature placeholder
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wallet feature coming soon!')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => _handleTap(context, ref),
      borderRadius: BorderRadius.circular(AppDimensions.chipRadius),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.chipRadius),
        border: Border.all(color: AppColors.outline),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            action.svgAsset,
            width: 26,
            height: 26,
            colorFilter: const ColorFilter.mode(
              AppColors.navSelected,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            action.label,
            style: context.labelSmall.copyWith(
              fontSize: 12,
              color: AppColors.onSurface,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
     ),
    );
  }
}
