import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ev_charging_finder/features/auth/presentation/providers/auth_notifier.dart';
import 'package:ev_charging_finder/features/auth/presentation/providers/auth_state.dart';
import 'package:ev_charging_finder/core/theme/app_colors.dart';
import 'package:ev_charging_finder/core/theme/app_typography.dart';
import 'package:ev_charging_finder/core/constants/app_dimensions.dart';
import 'package:ev_charging_finder/core/widgets/gap.dart';
import 'package:ev_charging_finder/core/widgets/hub_app_bar.dart';
import 'package:ev_charging_finder/features/auth/presentation/widgets/auth_text_field.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    final authState = ref.read(authProvider).value;
    final user = authState is AuthAuthenticated ? authState.user : null;
    
    _nameController = TextEditingController(text: user?.fullName ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name is required'), backgroundColor: AppColors.error),
      );
      return;
    }
    if (_phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Phone number is required'), backgroundColor: AppColors.error),
      );
      return;
    }

    await ref.read(authProvider.notifier).updateProfile(
      fullName: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
    );

    if (!mounted) return;

    final state = ref.read(authProvider);
    if (state.hasError || (state.value is AuthError)) {
      final message = state.value is AuthError 
          ? (state.value as AuthError).message 
          : 'Failed to update profile';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: AppColors.error),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const HubAppBar(title: 'Edit Profile', showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.pageHorizontalPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap.h24,
              Text(
                'Full Name',
                style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
              ),
              Gap.h8,
              AuthTextField(
                controller: _nameController,
                label: 'Full Name',
                hintText: 'Enter your full name',
                prefixIcon: Icons.person_outline_rounded,
              ),
              Gap.h20,
              Text(
                'Phone Number',
                style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
              ),
              Gap.h8,
              AuthTextField(
                controller: _phoneController,
                label: 'Phone Number',
                hintText: 'Enter your phone number',
                prefixIcon: Icons.phone_android_rounded,
                keyboardType: TextInputType.phone,
              ),
              Gap.h48,
              _SaveButton(
                onPressed: isLoading ? null : _handleSave,
                isLoading: isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({this.onPressed, this.isLoading = false});
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              'Save Changes',
              style: context.buttonLarge.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
    );
  }
}
