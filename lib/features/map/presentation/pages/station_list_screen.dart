import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/gap.dart';
import '../widgets/station_detail_sheet.dart';
import 'package:ev_charging_finder/features/filters/presentation/widgets/filter_bottom_sheet.dart';

class StationListScreen extends StatelessWidget {
  const StationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search charging station',
                    hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.hint),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: AppColors.primary),
            onPressed: () => FilterBottomSheet.show(context),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: 3,
        itemBuilder: (context, index) {
          return const _StationCard();
        },
      ),
    );
  }
}

class _StationCard extends StatefulWidget {
  const _StationCard();

  @override
  State<_StationCard> createState() => _StationCardState();
}

class _StationCardState extends State<_StationCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isExpanded 
                ? AppColors.primary.withValues(alpha: 0.4) 
                : AppColors.primary.withValues(alpha: 0.2), 
            width: _isExpanded ? 1.5 : 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'EV Charging Sarkhej',
                                style: AppTypography.titleLarge.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Icon(
                              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                              color: AppColors.primary,
                              size: 20,
                            ),
                          ],
                        ),
                        Gap.h2,
                        Text(
                          'Near 701, Sarkhej - Gandhinagar highway beside Iskon Gathiya shop...',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.onSurfaceVariant.withValues(alpha: 0.7),
                            fontSize: 11,
                            height: 1.3,
                          ),
                          maxLines: _isExpanded ? 3 : 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Gap.h8,
                        Row(
                          children: [
                            Text(
                              '10 Kms',
                              style: AppTypography.bodySmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: CircleAvatar(radius: 1.5, backgroundColor: Colors.grey),
                            ),
                            Text(
                              '8 mins',
                              style: AppTypography.bodySmall.copyWith(color: AppColors.hint, fontSize: 11),
                            ),
                            const Spacer(),
                            Row(
                              children: List.generate(5, (index) => Icon(
                                Icons.star,
                                size: 12,
                                color: index < 4 ? Colors.orange : Colors.grey[200],
                              )),
                            ),
                            Gap.w4,
                            Text(
                              '4.5',
                              style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gap.w8,
                  GestureDetector(
                    onTap: () {
                      // Navigate to details or directions
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.near_me_rounded, color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            if (_isExpanded) ...[
              const Divider(height: 1, color: AppColors.outline),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plugs available',
                      style: AppTypography.bodySmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                    Gap.h8,
                    Row(
                      children: [
                        Expanded(
                          child: _PlugChip(
                            label: 'Type 2',
                            subtitle: 'Level-2 240kV\nAC/DC',
                            color: AppColors.primary,
                          ),
                        ),
                        Gap.w8,
                        Expanded(
                          child: _PlugChip(
                            label: 'CCS 2',
                            subtitle: 'Level-3 (Fast Charging)\nDC',
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    Gap.h12,
                    Text(
                      'Nearby Amenities',
                      style: AppTypography.bodySmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                    Gap.h8,
                    Row(
                      children: [
                        _AmenityIcon(icon: Icons.wc_outlined),
                        _AmenityIcon(icon: Icons.local_parking_outlined),
                        _AmenityIcon(icon: Icons.restaurant_outlined),
                      ],
                    ),
                    Gap.h12,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => StationDetailSheet.show(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('View Station Details', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _PlugChip extends StatelessWidget {
  final String label;
  final String subtitle;
  final Color color;

  const _PlugChip({required this.label, required this.subtitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Icon(Icons.power_rounded, size: 24, color: Colors.black.withValues(alpha: 0.7)),
          Gap.w8,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 10, height: 1.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AmenityIcon extends StatelessWidget {
  final IconData icon;
  const _AmenityIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.outline),
      ),
      child: Icon(icon, size: 20, color: AppColors.onSurfaceVariant),
    );
  }
}
