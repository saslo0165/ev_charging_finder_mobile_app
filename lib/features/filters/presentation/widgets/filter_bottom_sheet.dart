import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/gap.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterBottomSheet(),
    );
  }

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool _availableNow = true;
  bool _available247 = false;
  int _selectedChargingLevel = 0;
  final Set<String> _selectedConnectors = {'Type 2'};
  final Set<String> _selectedAmenities = {};

  final List<Map<String, dynamic>> _amenities = [
    {'name': 'Cafe', 'icon': Icons.coffee_rounded},
    {'name': 'Parking', 'icon': Icons.local_parking_rounded},
    {'name': 'Restroom', 'icon': Icons.wc_rounded},
    {'name': 'Shopping', 'icon': Icons.shopping_bag_rounded},
    {'name': 'WiFi', 'icon': Icons.wifi_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          _buildHandle(),
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.pageHorizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('Connectors'),
                  Gap.h16,
                  _buildConnectorGrid(),
                  _buildDivider(),
                  _buildSectionHeader('Stations status'),
                  Gap.h12,
                  _buildSwitchRow('Available now', _availableNow, (v) => setState(() => _availableNow = v)),
                  _buildSwitchRow('Available 24/7', _available247, (v) => setState(() => _available247 = v)),
                  _buildDivider(),
                  _buildSectionHeader('Charging Level'),
                  Gap.h12,
                  _buildRadioRow('Level 1 AC (1.4 kW - 2.0 kW)', 0),
                  _buildRadioRow('Level 2 AC (3.3 kW - 19.2 kW)', 1),
                  _buildRadioRow('Level 3 DC (50 kW - 350 kW)', 2),
                  _buildDivider(),
                  _buildSectionHeader('Amenities'),
                  Gap.h16,
                  _buildAmenitiesList(),
                  Gap.h32,
                ],
              ),
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHandle() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Filters',
            style: AppTypography.titleLarge.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 22,
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _availableNow = false;
                _available247 = false;
                _selectedChargingLevel = 0;
                _selectedConnectors.clear();
                _selectedAmenities.clear();
              });
            },
            child: Text(
              'Reset all',
              style: AppTypography.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTypography.bodyLarge.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: 17,
      ),
    );
  }

  Widget _buildConnectorGrid() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _ConnectorChip(
          label: 'Type 2',
          power: '30 KW',
          isSelected: _selectedConnectors.contains('Type 2'),
          onTap: () => _toggleConnector('Type 2'),
        ),
        _ConnectorChip(
          label: 'CCS 2',
          power: '30 KW',
          isSelected: _selectedConnectors.contains('CCS 2'),
          onTap: () => _toggleConnector('CCS 2'),
        ),
        _ConnectorChip(
          label: 'CHADEMO',
          power: '50 KW',
          isSelected: _selectedConnectors.contains('CHADEMO'),
          onTap: () => _toggleConnector('CHADEMO'),
        ),
      ],
    );
  }

  Widget _buildAmenitiesList() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: _amenities.map((amenity) {
        final isSelected = _selectedAmenities.contains(amenity['name']);
        return FilterChip(
          label: Text(amenity['name']),
          avatar: Icon(
            amenity['icon'],
            size: 18,
            color: isSelected ? Colors.white : AppColors.onSurfaceVariant,
          ),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedAmenities.add(amenity['name']);
              } else {
                _selectedAmenities.remove(amenity['name']);
              }
            });
          },
          selectedColor: AppColors.primary,
          checkmarkColor: Colors.white,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : AppColors.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: isSelected ? AppColors.primary : AppColors.outline.withValues(alpha: 0.2),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
        onPressed: () => Navigator.pop(context),
        child: Text(
          'Show 34 results',
          style: AppTypography.bodyLarge.copyWith(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchRow(String label, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildRadioRow(String label, int value) {
    final isSelected = _selectedChargingLevel == value;
    return InkWell(
      onTap: () => setState(() => _selectedChargingLevel = value),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.outline.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            Gap.w16,
            Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                color: isSelected ? AppColors.onSurface : AppColors.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Divider(
        height: 1,
        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.08),
      ),
    );
  }

  void _toggleConnector(String type) {
    setState(() {
      if (_selectedConnectors.contains(type)) {
        _selectedConnectors.remove(type);
      } else {
        _selectedConnectors.add(type);
      }
    });
  }
}

class _ConnectorChip extends StatelessWidget {
  final String label;
  final String power;
  final bool isSelected;
  final VoidCallback onTap;

  const _ConnectorChip({
    required this.label,
    required this.power,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width - 60) / 2,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected 
              ? AppColors.primary.withValues(alpha: 0.05) 
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.outline.withValues(alpha: 0.15),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.ev_station_rounded,
              size: 28,
              color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            Gap.h12,
            Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w800,
                color: isSelected ? AppColors.primary : AppColors.onSurface,
              ),
            ),
            Text(
              power,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
