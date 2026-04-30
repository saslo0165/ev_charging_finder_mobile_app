import 'package:flutter/material.dart';
import 'package:ev_charging_finder/features/bookings/presentation/booking_list_screen.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/gap.dart';
import 'home_cards.dart';
import 'home_common_widgets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
    required this.isLocationGranted,
    required this.onEnableLocation,
  });

  final bool isLocationGranted;
  final VoidCallback onEnableLocation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isLocationGranted)
              LocationAlertBanner(onEnable: onEnableLocation),
            const _HomeContent(),
            Gap.h48,
            Gap.h48, // Spacing for bottom nav bar
          ],
        ),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.pageHorizontalPadding,
        vertical: AppDimensions.pageVerticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'ChargeHub public chargers',
            subtitle: '300+ chargers available',
          ),
          Gap.h20,
          MapPreviewCard(),
          Gap.h20,
          ReferralBannerCard(),
          Gap.h12,
        ],
      ),
    );
  }
}


class BookingsTab extends StatelessWidget {
  const BookingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const BookingListScreen(showBackButton: false);
  }
}
