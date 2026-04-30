import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../profile/presentation/profile_screen.dart';
import '../../vehicle_profile/presentation/my_vehicle_screen.dart';
import 'controllers/home_controller.dart';
import 'widgets/home_bottom_nav_bar.dart';
import 'widgets/home_tabs.dart';

/// App shell — owns the persistent Scaffold, BottomAppBar, and FAB.
class HomeScreen extends ConsumerStatefulWidget {
  final int initialIndex;
  const HomeScreen({super.key, this.initialIndex = 0});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Re-check permission on init through the controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = ref.read(homeControllerProvider.notifier);
      notifier.requestLocationPermission();
      if (widget.initialIndex != 0) {
        notifier.setSelectedIndex(widget.initialIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeControllerProvider);
    final notifier = ref.read(homeControllerProvider.notifier);

    return PopScope(
      canPop: homeState.selectedIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && homeState.selectedIndex != 0) {
          notifier.setSelectedIndex(0);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        // Using standard bottomNavigationBar for better stability and safe area handling
        bottomNavigationBar: HomeBottomNavBar(
          selectedIndex: homeState.selectedIndex,
          onItemTapped: notifier.setSelectedIndex,
          onFabTapped: () => context.push('/search-location'),
        ),
        // extendBody allows the FAB to overlap the body content nicely
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 90), // Offset for custom navigation bar
          child: IndexedStack(
            index: homeState.selectedIndex,
            children: [
              HomeTab(
                isLocationGranted: homeState.isLocationGranted,
                onEnableLocation: notifier.requestLocationPermission,
              ),
              const MyVehicleTab(),
              const BookingsTab(),
              const ProfileTab(),
            ],
          ),
        ),
      ),
    );
  }
}
