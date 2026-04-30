import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../core/widgets/gap.dart';
import '../../domain/models/vehicle_entry.dart';


// ── Vehicle card ───────────────────────────────────────────────────────────────

/// White card showing one vehicle with thumbnail, details, and a 3-dot menu.
class VehicleCard extends StatelessWidget {
  const VehicleCard({super.key, required this.vehicle});

  final VehicleEntry vehicle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.chipRadius),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _VehicleThumbnail(imagePath: vehicle.imagePath),
          Gap.w14,
          Expanded(child: _VehicleDetails(vehicle: vehicle)),
          _VehicleMenuButton(),
        ],
      ),
    );
  }
}

/// 72×56 image thumbnail; falls back to the SVG icon when no image path given.
class _VehicleThumbnail extends StatelessWidget {
  const _VehicleThumbnail({required this.imagePath});
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(10),
      ),
      child: imagePath != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imagePath!, fit: BoxFit.contain),
            )
          : Center(
              child: SvgPicture.asset(
                AppAssets.iconVehicle,
                width: 36,
                height: 36,
                colorFilter: const ColorFilter.mode(
                  AppColors.hint,
                  BlendMode.srcIn,
                ),
              ),
            ),
    );
  }
}

/// Name + year + registration number column.
class _VehicleDetails extends StatelessWidget {
  const _VehicleDetails({required this.vehicle});
  final VehicleEntry vehicle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          vehicle.name,
          style: context.headlineLarge.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: AppColors.onSurface,
          ),
        ),
        Gap.h4,
        Text(
          'Making Year : ${vehicle.makingYear}',
          style: context.bodyMedium.copyWith(fontSize: 12),
        ),
        Gap.h2,
        Text(
          'Registration No. : ${vehicle.registrationNo}',
          style: context.bodyMedium.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}

/// Three-dot overflow menu button.
class _VehicleMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, color: AppColors.onSurfaceVariant),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: (_) => const [
        PopupMenuItem(value: 'edit',   child: Text('Edit')),
        PopupMenuItem(value: 'delete', child: Text('Delete')),
      ],
    );
  }
}

// ── Add vehicle button ─────────────────────────────────────────────────────────

/// Dashed-border CTA — the screen's memorable design anchor.
class AddNewVehicleButton extends StatelessWidget {
  const AddNewVehicleButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: _DashedBorderPainter(
          color: AppColors.navSelected,
          radius: AppDimensions.chipRadius,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.navSelected, width: 1.5),
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColors.navSelected,
                  size: 16,
                ),
              ),
              Gap.w12,
              Text(
                'Add a new vehicle',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navSelected,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Draws a rounded-rect dashed border using [Canvas] — no third-party package needed.
class _DashedBorderPainter extends CustomPainter {
  const _DashedBorderPainter({required this.color, required this.radius});
  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const dashLen = 6.0;
    const gapLen  = 4.0;
    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );
    final path   = Path()..addRRect(rrect);
    final metric = path.computeMetrics().first;
    double dist  = 0;

    while (dist < metric.length) {
      canvas.drawPath(metric.extractPath(dist, dist + dashLen), paint);
      dist += dashLen + gapLen;
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter old) =>
      old.color != color || old.radius != radius;
}

// ── Section label ──────────────────────────────────────────────────────────────

/// Grey section heading (e.g. "Recently used").
class VehicleSectionLabel extends StatelessWidget {
  const VehicleSectionLabel({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.headlineLarge.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.onSurface,
      ),
    );
  }
}
