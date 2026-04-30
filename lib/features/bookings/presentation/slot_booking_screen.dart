import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/gap.dart';

class SlotBookingScreen extends StatefulWidget {
  const SlotBookingScreen({super.key});

  @override
  State<SlotBookingScreen> createState() => _SlotBookingScreenState();
}

class _SlotBookingScreenState extends State<SlotBookingScreen> {
  int _selectedConnectorIndex = 0;
  DateTime _selectedDate = DateTime.now();
  String? _selectedSlot;

  final List<Map<String, dynamic>> _connectors = [
    {'type': 'CCS 2', 'power': '120 kW', 'icon': Icons.bolt_rounded, 'available': true},
    {'type': 'Type 2', 'power': '22 kW', 'icon': Icons.electrical_services_rounded, 'available': true},
    {'type': 'CHAdeMO', 'power': '50 kW', 'icon': Icons.ev_station_rounded, 'available': false},
    {'type': 'Type 2', 'power': '7.4 kW', 'icon': Icons.electrical_services_rounded, 'available': true},
  ];

  final List<String> _timeSlots = [
    '08:00 AM', '09:00 AM', '10:00 AM', '11:00 AM',
    '12:00 PM', '01:00 PM', '02:00 PM', '03:00 PM',
    '04:00 PM', '05:00 PM', '06:00 PM', '07:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Select Connector & Slot',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _StationInfoMini(),
                  Gap.h24,
                  const _SectionHeader(title: 'Select Connector'),
                  Gap.h16,
                  _ConnectorGrid(
                    connectors: _connectors,
                    selectedIndex: _selectedConnectorIndex,
                    onSelect: (index) => setState(() => _selectedConnectorIndex = index),
                  ),
                  Gap.h24,
                  const _SectionHeader(title: 'Select Date'),
                  Gap.h16,
                  _DateSelector(
                    selectedDate: _selectedDate,
                    onDateSelected: (date) => setState(() => _selectedDate = date),
                  ),
                  Gap.h24,
                  const _SectionHeader(title: 'Select Time Slot'),
                  Gap.h16,
                  _TimeSlotGrid(
                    slots: _timeSlots,
                    selectedSlot: _selectedSlot,
                    onSlotSelected: (slot) => setState(() => _selectedSlot = slot),
                  ),
                  Gap.h24,
                ],
              ),
            ),
          ),
          _BookingSummaryFooter(
            selectedSlot: _selectedSlot,
            onPressed: () {
              // Navigate to payment
              context.push('/payment');
            },
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

class _StationInfoMini extends StatelessWidget {
  const _StationInfoMini();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.ev_station_rounded, color: AppColors.primary),
          ),
          Gap.w12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'EV Charging Sarkhej',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  'S-G Highway, Ahmedabad',
                  style: TextStyle(color: AppColors.hint, fontSize: 12),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 14),
              Gap.w4,
              const Text('4.8', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ConnectorGrid extends StatelessWidget {
  const _ConnectorGrid({
    required this.connectors,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<Map<String, dynamic>> connectors;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.4,
      ),
      itemCount: connectors.length,
      itemBuilder: (context, index) {
        final item = connectors[index];
        final isSelected = selectedIndex == index;
        final isAvailable = item['available'] as bool;

        return GestureDetector(
          onTap: isAvailable ? () => onSelect(index) : null,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary.withValues(alpha: 0.05) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.outline,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      color: isSelected ? AppColors.primary : Colors.black,
                      size: 20,
                    ),
                    if (!isAvailable)
                      const Text(
                        'Full',
                        style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
                Gap.h8,
                Text(
                  item['type'] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  item['power'] as String,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DateSelector extends StatelessWidget {
  const _DateSelector({required this.selectedDate, required this.onDateSelected});
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 14,
        itemBuilder: (context, index) {
          final date = DateTime.now().add(Duration(days: index));
          final isSelected = date.day == selectedDate.day && date.month == selectedDate.month;

          return GestureDetector(
            onTap: () => onDateSelected(date),
            child: Container(
              width: 60,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: isSelected ? Colors.black : AppColors.outline),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getDayName(date.weekday),
                    style: TextStyle(
                      color: isSelected ? Colors.white70 : Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                  Gap.h4,
                  Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getDayName(int day) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[day - 1];
  }
}

class _TimeSlotGrid extends StatelessWidget {
  const _TimeSlotGrid({
    required this.slots,
    required this.selectedSlot,
    required this.onSlotSelected,
  });

  final List<String> slots;
  final String? selectedSlot;
  final ValueChanged<String> onSlotSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.2,
      ),
      itemCount: slots.length,
      itemBuilder: (context, index) {
        final slot = slots[index];
        final isSelected = selectedSlot == slot;
        final isBooked = index == 2 || index == 5;

        return GestureDetector(
          onTap: isBooked ? null : () => onSlotSelected(slot),
          child: Container(
            decoration: BoxDecoration(
              color: isBooked 
                  ? Colors.grey[100] 
                  : isSelected ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.outline,
              ),
            ),
            child: Center(
              child: Text(
                slot,
                style: TextStyle(
                  color: isBooked ? Colors.grey[400] : isSelected ? Colors.white : Colors.black,
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  decoration: isBooked ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BookingSummaryFooter extends StatelessWidget {
  const _BookingSummaryFooter({required this.selectedSlot, required this.onPressed});
  final String? selectedSlot;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Amount', style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text(
                  '₹240.00',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Gap.w16,
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: selectedSlot != null ? onPressed : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Confirm Booking', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
