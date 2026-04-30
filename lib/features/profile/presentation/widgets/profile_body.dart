import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ev_charging_finder/features/home/presentation/controllers/home_controller.dart';
import 'package:ev_charging_finder/features/auth/presentation/providers/auth_notifier.dart';
import 'package:ev_charging_finder/features/auth/presentation/providers/auth_state.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/gap.dart';
import 'profile_header_widgets.dart';
import 'profile_menu_widgets.dart';

class ProfileBody extends ConsumerWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.pageHorizontalPadding,
        vertical: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _AvatarBlock(),
          Gap.h28,
          const ProfileQuickActions(),
          Gap.h24,
          const _SettingsMenuBlock(),
          Gap.h48,
          Gap.h48, // Spacing for bottom nav bar
        ],
      ),
    );
  }
}

class _AvatarBlock extends ConsumerWidget {
  const _AvatarBlock();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider).value;
    final user = authState is AuthAuthenticated ? authState.user : null;

    return Center(
      child: ProfileAvatarSection(
        name: user?.fullName ?? 'Guest User',
        phone: user?.phone ?? 'Not provided',
      ),
    );
  }
}

class _SettingsMenuBlock extends ConsumerWidget {
  const _SettingsMenuBlock();

  static List<ProfileMenuItem> _items(BuildContext context, WidgetRef ref) => [
    ProfileMenuItem(
      icon: Icons.person_outline_rounded,
      label: 'Edit Profile',
      onTap: () => context.push('/edit-profile'),
    ),
    ProfileMenuItem(
      icon: Icons.bookmark_border_rounded,
      label: 'Saved Stations',
      onTap: () => context.push('/saved-stations'),
    ),
    ProfileMenuItem(
      icon: Icons.history_rounded,
      label: 'My Bookings',
      onTap: () => ref.read(homeControllerProvider.notifier).setSelectedIndex(2),
    ),
    ProfileMenuItem(
      icon: Icons.calendar_month_rounded,
      label: 'Book a Slot',
      onTap: () => context.push('/booking-slot'),
    ),
    const ProfileMenuItem(icon: Icons.notifications_none_rounded, label: 'Notifications'),
    const ProfileMenuItem(icon: Icons.headset_mic_outlined, label: 'Help & Support'),
    const ProfileMenuItem(icon: Icons.security_outlined, label: 'Account Privacy'),
    ProfileMenuItem(
      icon: Icons.logout_rounded,
      label: 'Logout',
      isDestructive: true,
      onTap: () {
        showAdaptiveDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ref.read(authProvider.notifier).logout();
                  context.go('/login');
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) => ProfileMenuList(items: _items(context, ref));
}
