import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/gap.dart';
import '../../domain/models/plug_data.dart';

const List<PlugData> kSamplePlugs = [
  PlugData(
    title: 'Type 2',
    subtitle: 'Level-2 240kV',
    connectorType: 'AC/DC',
    svgAsset: 'assets/svg/ev_type2.svg',
  ),
  PlugData(
    title: 'CCS 2',
    subtitle: 'Level-3 (Fast)',
    connectorType: 'DC',
    svgAsset: 'assets/svg/ev_ccs2.svg',
  ),
  PlugData(
    title: 'Type 2',
    subtitle: 'Level-1',
    connectorType: 'AC',
    svgAsset: 'assets/svg/ev_type2.svg',
    isDisabled: true,
  ),
];

class StationDetailSheet extends StatefulWidget {
  const StationDetailSheet({
    super.key,
    required this.selectedPlugIndex,
    required this.onPlugSelected,
  });

  final int? selectedPlugIndex;
  final ValueChanged<int> onPlugSelected;

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const StationDetailSheet(
        selectedPlugIndex: null,
        onPlugSelected: _noop,
      ),
    );
  }

  static void _noop(int? i) {}

  @override
  State<StationDetailSheet> createState() => _StationDetailSheetState();
}

class _StationDetailSheetState extends State<StationDetailSheet> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isModal = ModalRoute.of(context)?.isCurrent ?? false;

    Widget content = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 30,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _DragHandle(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const _StationHeader(),
          ),
          Gap.h24,
          TabBar(
            controller: _tabController,
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.hint,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Tab(text: 'Charger'),
              Tab(text: 'Amenities'),
              Tab(text: 'Reviews'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _ChargerTab(onPlugSelected: widget.onPlugSelected),
                const _AmenitiesTab(),
                const _ReviewsTab(),
              ],
            ),
          ),
          _BookingFooter(onPressed: () {
            // Navigate to actual slot booking screen
            context.push('/booking-slot');
          }),
        ],
      ),
    );

    if (!isModal) {
      return DraggableScrollableSheet(
        initialChildSize: 0.45,
        minChildSize: 0.40,
        maxChildSize: 0.90,
        builder: (context, scrollController) {
          return content;
        },
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: content,
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        width: 40,
        height: 5,
        decoration: BoxDecoration(
          color: const Color(0xFFE2E8F0),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}

class _StationHeader extends StatelessWidget {
  const _StationHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('EV Charging Sarkhej', style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.bold)),
              Gap.h8,
              Text(
                'Near 701, Sarkhej - Gandhinagar highway beside Iskon Gathiya shop...',
                style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant),
              ),
              Gap.h12,
              Row(
                children: [
                  Text('10 Kms • 8 mins', style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Row(
                    children: List.generate(5, (index) => Icon(
                      Icons.star,
                      size: 16,
                      color: index < 4 ? Colors.orange : Colors.grey[300],
                    )),
                  ),
                  Gap.w4,
                  Text('4.5', style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
        Gap.w16,
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.near_me_rounded, color: Colors.black, size: 22),
        ),
      ],
    );
  }
}

class _ChargerTab extends StatelessWidget {
  const _ChargerTab({required this.onPlugSelected});
  final ValueChanged<int> onPlugSelected;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _ChargerCard(
          title: 'CCS-2',
          subtitle: 'Type 2 | AC',
          capacity: '25Kw',
          price: '₹0/unit',
          status: 'Available',
          isAvailable: true,
          onTap: () => onPlugSelected(0),
        ),
        Gap.h16,
        _ChargerCard(
          title: 'CCS-2',
          subtitle: 'Type 2 | AC',
          capacity: '25Kw',
          price: '₹0/unit',
          status: 'Available',
          isAvailable: true,
          onTap: () => onPlugSelected(1),
        ),
        Gap.h16,
        _ChargerCard(
          title: 'CCS-2',
          subtitle: 'Type 2 | AC',
          capacity: '25Kw',
          price: '₹0/unit',
          status: 'Unavailable',
          isAvailable: false,
          onTap: () => onPlugSelected(2),
        ),
      ],
    );
  }
}

class _ChargerCard extends StatelessWidget {
  const _ChargerCard({
    required this.title,
    required this.subtitle,
    required this.capacity,
    required this.price,
    required this.status,
    required this.isAvailable,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String capacity;
  final String price;
  final String status;
  final bool isAvailable;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.outline.withValues(alpha: 0.5)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(
                  status,
                  style: TextStyle(
                    color: isAvailable ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.power_rounded, size: 24),
                ),
                Gap.w12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Capacity : $capacity', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    Gap.h4,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.outline),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text('AC', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AmenitiesTab extends StatelessWidget {
  const _AmenitiesTab();

  @override
  Widget build(BuildContext context) {
    final amenities = [
      {'icon': Icons.wc_outlined, 'label': 'Washroom'},
      {'icon': Icons.local_parking_outlined, 'label': 'Parking'},
      {'icon': Icons.wifi, 'label': 'Wifi'},
      {'icon': Icons.restaurant_outlined, 'label': 'Restaurant'},
      {'icon': Icons.coffee_outlined, 'label': 'Cafe'},
      {'icon': Icons.hotel_outlined, 'label': 'Hotel'},
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: amenities.length,
      itemBuilder: (context, index) {
        final item = amenities[index];
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.outline),
              ),
              child: Icon(item['icon'] as IconData, color: AppColors.onSurfaceVariant),
            ),
            Gap.h8,
            Text(
              item['label'] as String,
              style: const TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}

class _ReviewsTab extends StatelessWidget {
  const _ReviewsTab();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('5.0', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              Gap.w16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(5, (_) => const Icon(Icons.star, color: Colors.orange, size: 16)),
                  ),
                  const Text('Based on 12 reviews', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
          Gap.h24,
          const Text('No reviews yet in detail view.', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _BookingFooter extends StatelessWidget {
  const _BookingFooter({required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Book your slot', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
