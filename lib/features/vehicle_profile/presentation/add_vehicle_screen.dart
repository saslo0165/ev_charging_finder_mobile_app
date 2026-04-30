import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  String? _selectedType;
  String? _selectedBrand;
  String? _selectedModel;
  String? _selectedYear;
  final _regController = TextEditingController();
  final _licenseController = TextEditingController();
  final _travellingController = TextEditingController();

  final List<String> _brands = ['Ather Energy', 'Ola', 'Super Soco', 'NIU', 'Energic', 'Revolt Motors'];
  final List<String> _models = ['Model S', 'Model 3', 'Model X', 'Model Y']; // Example models
  final List<String> _years = ['2020', '2021', '2022', '2023', '2024'];

  bool get _isFormValid =>
      _selectedType != null &&
      _selectedBrand != null &&
      _selectedModel != null &&
      _selectedYear != null &&
      _regController.text.isNotEmpty &&
      _licenseController.text.isNotEmpty &&
      _travellingController.text.isNotEmpty;

  @override
  void dispose() {
    _regController.dispose();
    _licenseController.dispose();
    _travellingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          'Add vehicle details',
          style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.onSurface),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: () => context.go('/'),
            child: const Text(
              'Skip',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: context.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                  children: const [
                    TextSpan(text: 'Select vehicle type'),
                    TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildTypeRadio('2- Wheeler'),
              const SizedBox(height: 8),
              _buildTypeRadio('4- Wheeler'),
              const SizedBox(height: 32),
              _CustomDropdown(
                label: 'Select Brand',
                value: _selectedBrand,
                items: _brands,
                onChanged: (val) => setState(() => _selectedBrand = val),
                hasImages: true, // Specifically requested for Brand
              ),
              const SizedBox(height: 16),
              _CustomDropdown(
                label: 'Select Model',
                value: _selectedModel,
                items: _models,
                onChanged: (val) => setState(() => _selectedModel = val),
              ),
              const SizedBox(height: 16),
              _CustomDropdown(
                label: 'Manufacturing Year',
                value: _selectedYear,
                items: _years,
                onChanged: (val) => setState(() => _selectedYear = val),
              ),
              const SizedBox(height: 32),
              _buildTextField('Registration No.', 'Example : GJ01XX1111', _regController),
              const SizedBox(height: 24),
              _buildTextField('License No.', 'Example : GJ01 20120123456.', _licenseController),
              const SizedBox(height: 24),
              _buildTextField('Daily Travelling', 'Enter in Kilometers', _travellingController, keyboardType: TextInputType.number),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isFormValid ? Colors.black : const Color(0xFFF1F5F9),
                    foregroundColor: _isFormValid ? Colors.white : AppColors.onSurfaceVariant,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _isFormValid ? () => context.go('/') : null,
                  child: const Text('Save and Continue'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypeRadio(String type) {
    bool isSelected = _selectedType == type;
    return GestureDetector(
      onTap: () => setState(() => _selectedType = type),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primary : const Color(0xFFD1D5DB),
                width: isSelected ? 6 : 1.5,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            type,
            style: context.bodyLarge.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller, {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _CustomDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final bool hasImages;

  const _CustomDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hasImages = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  label,
                  style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                ),
              ),
              isExpanded: true,
              icon: const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.keyboard_arrow_down, color: Color(0xFF94A3B8)),
              ),
              items: items.map((String item) {
                // Add icons/images for top 2 brands if requested
                Widget? leading;
                if (hasImages && (item == 'Ather Energy' || item == 'Ola')) {
                  leading = Container(
                    width: 28,
                    height: 28,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo.png', // Placeholder logo
                        width: 18,
                        height: 18,
                      ),
                    ),
                  );
                }

                return DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        ?leading,
                        Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              borderRadius: BorderRadius.circular(12),
              dropdownColor: Colors.white,
              elevation: 4,
            ),
          ),
        ),
      ],
    );
  }
}
