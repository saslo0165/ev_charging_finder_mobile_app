import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'widgets/map_overlay_widgets.dart';
import 'widgets/map_view_components.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const Stack(
        children: [
          MapBackground(),
          MapMarkerLayer(),
          MapSearchBar(),
          MapActionButtons(),
        ],
      ),
    );
  }
}
