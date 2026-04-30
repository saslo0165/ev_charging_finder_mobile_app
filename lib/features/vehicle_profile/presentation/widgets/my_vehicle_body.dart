import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/gap.dart';
import '../../domain/models/vehicle_entry.dart';
import 'vehicle_widgets.dart';

const kSampleVehicles = [
  VehicleEntry(
    name: 'MG ZS',
    makingYear: '2021',
    registrationNo: 'GJ01XX1092',
  ),
  VehicleEntry(
    name: 'Simple Energy One',
    makingYear: '2024',
    registrationNo: 'GJ01DX3452',
  ),
];

class MyVehicleBody extends StatelessWidget {
  const MyVehicleBody({super.key, required this.onAddVehicle});
  final VoidCallback onAddVehicle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.pageHorizontalPadding,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VehicleSectionLabel(text: 'Recently used'),
          Gap.h16,
          const _VehicleList(),
          Gap.h20,
          AddNewVehicleButton(onTap: onAddVehicle),
          Gap.h48,
          Gap.h48, // Spacing for bottom nav bar
        ],
      ),
    );
  }
}

class _VehicleList extends StatelessWidget {
  const _VehicleList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < kSampleVehicles.length; i++) ...[
          if (i > 0) Gap.h12,
          VehicleCard(vehicle: kSampleVehicles[i]),
        ],
      ],
    );
  }
}
