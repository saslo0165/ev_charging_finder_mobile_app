import 'package:flutter/material.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/gap.dart';
import '../../../core/widgets/hub_app_bar.dart';

// ─────────────────────────────────────────────────────────────
// Domain model
// ─────────────────────────────────────────────────────────────

enum BookingStatus { upcoming, completed, cancelled }

class Booking {
  final String id;
  final String stationName;
  final String stationAddress;
  final String connectorType;
  final DateTime date;
  final String timeSlot;   // e.g. "10:00 – 11:00 AM"
  final BookingStatus status;
  final double amountPaid;

  const Booking({
    required this.id,
    required this.stationName,
    required this.stationAddress,
    required this.connectorType,
    required this.date,
    required this.timeSlot,
    required this.status,
    required this.amountPaid,
  });
}

// ─────────────────────────────────────────────────────────────
// Mock data — swap with Riverpod provider when API is ready
// ─────────────────────────────────────────────────────────────

final List<Booking> kMockBookings = [
  Booking(
    id: 'B001',
    stationName: 'EV Charging Sarkhej',
    stationAddress: 'Near Iskon Gathiya shop, S-G Highway',
    connectorType: 'CCS 2 · 120 kW',
    date: DateTime(2026, 4, 26),
    timeSlot: '10:00 – 11:00 AM',
    status: BookingStatus.upcoming,
    amountPaid: 240.00,
  ),
  Booking(
    id: 'B002',
    stationName: 'Charge Point – Bodakdev',
    stationAddress: 'Near Siddhi Vinayak Mall, Bodakdev',
    connectorType: 'Type 2 · 22 kW',
    date: DateTime(2026, 4, 20),
    timeSlot: '02:00 – 03:30 PM',
    status: BookingStatus.completed,
    amountPaid: 180.00,
  ),
  Booking(
    id: 'B003',
    stationName: 'Tata Power EZ Charge',
    stationAddress: 'Vastrapur Lake Road, Vastrapur',
    connectorType: 'CCS 2 · 30 kW',
    date: DateTime(2026, 4, 18),
    timeSlot: '06:30 – 07:30 PM',
    status: BookingStatus.cancelled,
    amountPaid: 0.00,
  ),
  Booking(
    id: 'B004',
    stationName: 'Zeon Charging Station',
    stationAddress: 'Drive-In Road, Thaltej',
    connectorType: 'Type 2 · 7 kW',
    date: DateTime(2026, 5, 1),
    timeSlot: '09:00 – 10:00 AM',
    status: BookingStatus.upcoming,
    amountPaid: 110.00,
  ),
];

// ─────────────────────────────────────────────────────────────
// Status badge configuration — driven purely by AppColors
// ─────────────────────────────────────────────────────────────

extension _StatusTheme on BookingStatus {
  String get label {
    switch (this) {
      case BookingStatus.upcoming:   return 'Upcoming';
      case BookingStatus.completed:  return 'Completed';
      case BookingStatus.cancelled:  return 'Cancelled';
    }
  }

  // Badge background
  Color get background {
    switch (this) {
      case BookingStatus.upcoming:   return AppColors.secondary.withValues(alpha: 0.12);
      case BookingStatus.completed:  return AppColors.primary.withValues(alpha: 0.10);
      case BookingStatus.cancelled:  return AppColors.error.withValues(alpha: 0.10);
    }
  }

  // Badge text / icon colour
  Color get foreground {
    switch (this) {
      case BookingStatus.upcoming:   return AppColors.secondary;
      case BookingStatus.completed:  return AppColors.success;
      case BookingStatus.cancelled:  return AppColors.error;
    }
  }

  // Left accent stripe on each card
  Color get accentStripe {
    switch (this) {
      case BookingStatus.upcoming:   return AppColors.secondary;
      case BookingStatus.completed:  return AppColors.primary;
      case BookingStatus.cancelled:  return AppColors.error;
    }
  }

  IconData get icon {
    switch (this) {
      case BookingStatus.upcoming:   return Icons.schedule_rounded;
      case BookingStatus.completed:  return Icons.check_circle_outline_rounded;
      case BookingStatus.cancelled:  return Icons.cancel_outlined;
    }
  }
}

// ─────────────────────────────────────────────────────────────
// Screen
// ─────────────────────────────────────────────────────────────

class BookingListScreen extends StatelessWidget {
  final bool showBackButton;
  const BookingListScreen({super.key, this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    // Swap kMockBookings with a Riverpod provider when ready
    final bookings = kMockBookings;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: HubAppBar(
        title: 'My Bookings',
        showBackButton: showBackButton,
        titleStyle: AppTypography.titleLarge.copyWith(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: AppColors.onSurface,
        ),
      ),
      body: bookings.isEmpty ? const _EmptyState() : _BookingList(bookings: bookings),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// List body
// ─────────────────────────────────────────────────────────────

class _BookingList extends StatelessWidget {
  final List<Booking> bookings;
  const _BookingList({required this.bookings});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.pageHorizontalPadding,
        vertical: AppDimensions.pageVerticalPadding,
      ),
      itemCount: bookings.length,
      separatorBuilder: (context, index) => Gap.h12,
      itemBuilder: (_, index) => _BookingCard(booking: bookings[index]),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Booking card — asymmetric: left accent stripe + icon header
// ─────────────────────────────────────────────────────────────

class _BookingCard extends StatelessWidget {
  final Booking booking;
  const _BookingCard({required this.booking});

  @override
  Widget build(BuildContext context) {
    final s = booking.status;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      // ClipRRect so the accent stripe respects the card's rounded corners
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Left accent stripe ──────────────────────────────
              Container(width: 5, color: s.accentStripe),

              // ── Card content ─────────────────────────────────────
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header row: station name + status badge
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              booking.stationName,
                              style: AppTypography.headlineLarge.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Gap.w8,
                          _StatusBadge(status: s),
                        ],
                      ),
                      Gap.h4,

                      // Address
                      Text(
                        booking.stationAddress,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      Gap.h12,
                      const Divider(height: 1, color: AppColors.outlineVariant),
                      Gap.h12,

                      // Info row: date, time, connector
                      Row(
                        children: [
                          _InfoChip(
                            icon: Icons.calendar_today_rounded,
                            label: _formatDate(booking.date),
                          ),
                          Gap.w12,
                          _InfoChip(
                            icon: Icons.schedule_rounded,
                            label: booking.timeSlot,
                          ),
                        ],
                      ),
                      Gap.h2,
                      _InfoChip(
                        icon: Icons.electrical_services_rounded,
                        label: booking.connectorType,
                      ),

                      // Amount (skip for cancelled bookings)
                      if (booking.status != BookingStatus.cancelled) ...[
                        Gap.h12,
                        Align(
                          alignment: Alignment.centerRight,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '₹${booking.amountPaid.toStringAsFixed(0)}',
                                  style: AppTypography.headlineLarge.copyWith(
                                    color: AppColors.onSurface,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                TextSpan(
                                  text: '  paid',
                                  style: AppTypography.bodySmall.copyWith(
                                    color: AppColors.hint,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime d) {
    const months = [
      'Jan','Feb','Mar','Apr','May','Jun',
      'Jul','Aug','Sep','Oct','Nov','Dec'
    ];
    return '${d.day} ${months[d.month - 1]} ${d.year}';
  }
}

// ─────────────────────────────────────────────────────────────
// Status badge
// ─────────────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  final BookingStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: status.background,
        borderRadius: BorderRadius.circular(AppDimensions.chipRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(status.icon, size: 13, color: status.foreground),
          Gap.w4,
          Text(
            status.label,
            style: AppTypography.labelSmall.copyWith(
              color: status.foreground,
              fontWeight: FontWeight.w700,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Info chip (date / time / connector)
// ─────────────────────────────────────────────────────────────

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppColors.hint),
        Gap.w4,
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Empty state — memo-style: single card, centred illustration
// ─────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Illustrated icon container
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.receipt_long_rounded,
                size: 48,
                color: AppColors.primary,
              ),
            ),
            Gap.h24,
            Text(
              'No bookings yet',
              style: AppTypography.titleLarge.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            Gap.h8,
            Text(
              'Your charging session bookings will\nappear here once you reserve a slot.',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.onSurfaceVariant,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
            Gap.h32,
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.chipRadius),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.map_outlined, size: 18),
              label: Text(
                'Find a Charging Station',
                style: AppTypography.buttonLarge.copyWith(
                  color: AppColors.primary,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
