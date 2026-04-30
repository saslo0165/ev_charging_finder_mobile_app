import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/hub_app_bar.dart';
import 'widgets/profile_body.dart';

/// Standalone profile screen — used when navigating directly to /profile.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
      child: const Scaffold(
        backgroundColor: AppColors.background,
        appBar: HubAppBar(title: 'My Profile', showBackButton: true),
        body: ProfileBody(),
      ),
    );
  }
}

/// Tab-embedded version used inside the shell's IndexedStack.
class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
      child: const ColoredBox(
        color: AppColors.background,
        child: Column(
          children: [
            SizedBox(
              height: 56,
              child: HubAppBar(title: 'My Profile'),
            ),
            Expanded(child: ProfileBody()),
          ],
        ),
      ),
    );
  }
}
