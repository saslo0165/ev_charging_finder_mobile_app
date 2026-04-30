import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class MapBackground extends StatelessWidget {
  const MapBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF1F4F1),
      child: const Stack(
        children: [
          _RiverStrip(),
          _RoadShape(),
          _RoadLabel(),
        ],
      ),
    );
  }
}

class _RiverStrip extends StatelessWidget {
  const _RiverStrip();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 300,
      left: 0,
      right: 0,
      height: 120,
      child: Transform.rotate(
        angle: -0.4,
        child: Container(color: const Color(0xFFD4E8F1)),
      ),
    );
  }
}

class _RoadShape extends StatelessWidget {
  const _RoadShape();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 150,
      left: -100,
      width: 800,
      height: 400,
      child: Transform.rotate(
        angle: 0.8,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 20),
          ),
        ),
      ),
    );
  }
}

class _RoadLabel extends StatelessWidget {
  const _RoadLabel();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 350,
      right: 80,
      child: Text(
        'SARKHEJ - GANDHINAGAR HWY',
        style: AppTypography.labelSmall.copyWith(
          color: const Color(0xFFC0C8C0),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MapMarkerLayer extends StatelessWidget {
  const MapMarkerLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(top: 120,  right: 100, child: MapMarker(isActive: false)),
        Positioned(top: 320,  left: 160,  child: MapMarker(isActive: true)),
        Positioned(top: 280,  left: 220,  child: MapNavigationArrow()),
        Positioned(bottom: 450, left: 100, child: MapMarker(isActive: false)),
        Positioned(top: 380,  right: 40,  child: MapMarker(isActive: false)),
        Positioned(top: 480,  right: 120, child: MapMarker(isActive: false)),
      ],
    );
  }
}

class MapNavigationArrow extends StatelessWidget {
  const MapNavigationArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.5,
      child: const Icon(Icons.navigation, color: AppColors.primary, size: 18),
    );
  }
}

class MapMarker extends StatelessWidget {
  const MapMarker({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    const disabledColor = Color(0xFF94A3B8);
    final color = isActive ? AppColors.primary : disabledColor;
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isActive)
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.2),
            ),
          ),
        Icon(Icons.location_on, color: color, size: isActive ? 40 : 32),
        Positioned(
          top: isActive ? 6 : 4,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Icon(Icons.bolt, color: color, size: isActive ? 14 : 10),
          ),
        ),
      ],
    );
  }
}
