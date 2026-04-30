import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/theme/app_colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildConnectorSection(),
                  _buildDivider(),
                  _buildStatusSection(),
                  _buildDivider(),
                  _buildChargingLevelSection(),
                  _buildDivider(),
                  _buildAmenitiesSection(),
                ],
              ),
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primary),
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Text(
              'Filters',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _availableNow = false;
                _available247 = false;
                _selectedChargingLevel = 0;
                _selectedConnectors.clear();
              });
            },
            child: const Text(
              'Clear all',
              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectorSection() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.pageHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Connectors', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Gap.h16,
          Row(
            children: [
              _ConnectorChip(
                label: 'Type 2',
                power: '30 KW',
                isSelected: _selectedConnectors.contains('Type 2'),
                onTap: () => _toggleConnector('Type 2'),
              ),
              Gap.w12,
              _ConnectorChip(
                label: 'CCS 2',
                power: '30 KW',
                isSelected: _selectedConnectors.contains('CCS 2'),
                onTap: () => _toggleConnector('CCS 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSection() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.pageHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Stations status', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Gap.h12,
          _buildSwitchRow('Available now', _availableNow, (v) => setState(() => _availableNow = v)),
          _buildSwitchRow('Available 24/7', _available247, (v) => setState(() => _available247 = v)),
        ],
      ),
    );
  }

  Widget _buildChargingLevelSection() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.pageHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Charging Level', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Gap.h12,
          _buildRadioRow('Level 1 AC (1.4 kW - 2.0 kW)', 0),
          _buildRadioRow('Level 2 AC (3.3 kW - 19.2 kW)', 1),
          _buildRadioRow('Level 3 DC (50 kW - 350 kW)', 2),
        ],
      ),
    );
  }

  Widget _buildAmenitiesSection() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.pageHorizontalPadding),
      child: const Text('Amenities', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.pageHorizontalPadding),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () => Navigator.pop(context),
          child: const Text('Show 34 results', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildSwitchRow(String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 15)),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: AppColors.primary,
        ),
      ],
    );
  }

  Widget _buildRadioRow(String label, int value) {
    return GestureDetector(
      onTap: () => setState(() => _selectedChargingLevel = value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _selectedChargingLevel == value ? AppColors.primary : AppColors.outline,
                  width: 2,
                ),
              ),
              child: _selectedChargingLevel == value
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                      ),
                    )
                  : null,
            ),
            Gap.w12,
            Text(label, style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 8, color: AppColors.surface);
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
        width: 130,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.outline,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.settings_input_component_rounded, size: 24, color: Colors.grey),
            Gap.w8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(power, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
