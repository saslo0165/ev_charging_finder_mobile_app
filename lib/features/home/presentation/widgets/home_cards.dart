import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_dimensions.dart';

/// Referral promotion banner — renders the [AppAssets.banner1] image scaled
/// to fill the card without cropping any edge.
class ReferralBannerCard extends StatelessWidget {
  const ReferralBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
      child: SizedBox(
        width: double.infinity,
        height: AppDimensions.bannerCardHeight,
        child: Image.asset(
          AppAssets.banner1,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

/// Map preview card with an overlay vignette, markers, and an explore pill.
class MapPreviewCard extends StatelessWidget {
  const MapPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppDimensions.mapCardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 18,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        child: Stack(
          children: [
            _MapImage(),
            const _BrandVignette(),
            const Positioned(top: 40,  left: 60,  child: _MapMarker()),
            const Positioned(top: 100, right: 80, child: _MapMarker()),
            const _ExplorePill(),
          ],
        ),
      ),
    );
  }
}

class _MapImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.fullMap,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

/// Subtle bottom-to-top brand-colour gradient — the design's memorability anchor.
class _BrandVignette extends StatelessWidget {
  const _BrandVignette();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              AppColors.primary.withValues(alpha: 0.18),
            ],
            stops: const [0.55, 1.0],
          ),
        ),
      ),
    );
  }
}

/// A green bolt-icon pin shown on the map preview.
class _MapMarker extends StatelessWidget {
  const _MapMarker();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.92),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.35),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Icon(Icons.bolt, color: Colors.white, size: 18),
    );
  }
}

/// Floating pill at the bottom of [MapPreviewCard] — CTA design anchor.
class _ExplorePill extends StatelessWidget {
  const _ExplorePill();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 14,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.90),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Color(0x14000000), blurRadius: 8),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.touch_app, color: AppColors.primary, size: 16),
              const SizedBox(width: 6),
              Text(
                'Tap to explore chargers',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
