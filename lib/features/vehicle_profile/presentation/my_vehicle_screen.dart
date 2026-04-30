import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/hub_app_bar.dart';
import 'widgets/my_vehicle_body.dart';

/// Full standalone screen — used when navigating directly to /my-vehicle.
class MyVehicleScreen extends StatelessWidget {
  const MyVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: const HubAppBar(title: 'My Vehicle'),
      body: MyVehicleBody(onAddVehicle: () => context.push('/add-vehicle')),
    );
  }
}

/// Tab-embedded version used inside the shell's IndexedStack.
class MyVehicleTab extends StatelessWidget {
  const MyVehicleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F2F2),
      child: Column(
        children: [
          const SizedBox(
            height: 56,
            child: HubAppBar(title: 'My Vehicle'),
          ),
          Expanded(
            child: MyVehicleBody(
              onAddVehicle: () => context.push('/add-vehicle'),
            ),
          ),
        ],
      ),
    );
  }
}
