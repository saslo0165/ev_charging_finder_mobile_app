import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/gap.dart';
import '../../../../core/widgets/hub_app_bar.dart';
import 'providers/auth_state.dart';
import 'providers/auth_notifier.dart';
import 'widgets/auth_text_field.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agreedToTerms = false;

  bool get _isNameValid => _nameController.text.trim().length >= 3;
  bool get _isPhoneValid => RegExp(r'^[0-9]{10,12}$').hasMatch(_phoneController.text.trim());
  bool get _isEmailValid => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_emailController.text.trim());
  bool get _isPasswordValid => _passwordController.text.length >= 6;

  bool get _isFormValid =>
      _isNameValid &&
      _isPhoneValid &&
      _isEmailValid &&
      _isPasswordValid &&
      _agreedToTerms;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState.isLoading;

    ref.listen(authProvider, (previous, next) {
      next.whenData((state) {
        if (state is AuthAuthenticated) {
          context.push('/registration-success');
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HubAppBar(
        title: '',
        showBackButton: true,
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap.h20,
              Text(
                'Sign Up',
                style: AppTypography.titleLarge.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Gap.h8,
              Text(
                'Sign up for an ChargeHub account with your number or E-mail Id',
                style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
              ),
              Gap.h40,
              AuthTextField(
                controller: _nameController,
                label: 'Name',
                hintText: 'Enter your name',
                prefixIcon: Icons.person_outline,
                onChanged: (_) => setState(() {}),
                errorText: _nameController.text.isNotEmpty && !_isNameValid ? 'Name is too short' : null,
              ),
              Gap.h20,
              AuthTextField(
                controller: _phoneController,
                label: 'Phone Number',
                hintText: 'Enter phone number',
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                onChanged: (_) => setState(() {}),
                errorText: _phoneController.text.isNotEmpty && !_isPhoneValid ? 'Invalid phone number' : null,
              ),
               Gap.h20,
              AuthTextField(
                controller: _emailController,
                label: 'Email - Id',
                hintText: 'Enter email address',
                prefixIcon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) => setState(() {}),
                errorText: _emailController.text.isNotEmpty && !_isEmailValid ? 'Invalid email address' : null,
              ),
              Gap.h20,
              AuthTextField(
                controller: _passwordController,
                label: 'Password',
                hintText: 'Enter password',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                onChanged: (_) => setState(() {}),
                errorText: _passwordController.text.isNotEmpty && !_isPasswordValid ? 'Password must be at least 6 characters' : null,
              ),
              Gap.h24,
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: _agreedToTerms,
                      activeColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onChanged: (value) => setState(() => _agreedToTerms = value ?? false),
                    ),
                  ),
                  Gap.w12,
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
                        children: [
                          const TextSpan(text: 'I agree to the '),
                          TextSpan(
                            text: 'terms',
                            style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'conditions',
                            style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Gap.h48,
              Gap.h48, // Replacement for height: 120
              Gap.h24,
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isFormValid && !isLoading ? AppColors.primary : const Color(0xFFF1F5F9),
                          foregroundColor: _isFormValid && !isLoading ? Colors.white : AppColors.onSurfaceVariant,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: _isFormValid && !isLoading
                            ? () {
                                ref.read(authProvider.notifier).register(
                                      fullName: _nameController.text.trim(),
                                      phone: _phoneController.text.trim(),
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text,
                                    );
                              }
                            : null,
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Done'),
                      ),
                    ),
                    Gap.h24,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: AppTypography.bodySmall.copyWith(color: Colors.black, fontSize: 12),
                        children: [
                          const TextSpan(text: 'By continuing, I accept '),
                          TextSpan(
                            text: 'Terms of service',
                            style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: ' & '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Gap.h24,
                    Center(
                      child: GestureDetector(
                        onTap: () => context.pop(),
                        child: RichText(
                          text: TextSpan(
                            style: AppTypography.bodyMedium.copyWith(color: Colors.black),
                            children: [
                              const TextSpan(text: "Already have an account? "),
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Gap.h24,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
