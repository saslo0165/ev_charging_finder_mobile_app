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

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController(text: 'montu@yopmail.com');
  final _passwordController = TextEditingController(text: 'Test@123');

  bool get _isEmailValid => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_emailController.text.trim());
  bool get _isPasswordValid => _passwordController.text.length >= 6;

  bool get _isFormValid => _isEmailValid && _isPasswordValid;

  @override
  void dispose() {
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
          context.go('/'); // Navigate to home
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
        showBackButton: false,
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
                'Sign In',
                style: AppTypography.titleLarge.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Gap.h8,
              Text(
                'Sign in to your ChargeHub account with your registered E-mail Id',
                style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
              ),
              Gap.h40,
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
              Gap.h12,
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: Implement Forgot Password
                  },
                  child: Text(
                    'Forgot Password?',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Gap.h32,
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
                          ref.read(authProvider.notifier).login(
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
                      : const Text('Sign In'),
                ),
              ),
              Gap.h24,
              Center(
                child: GestureDetector(
                  onTap: () => context.push('/signup'),
                  child: RichText(
                    text: TextSpan(
                      style: AppTypography.bodyMedium.copyWith(color: Colors.black),
                      children: [
                        const TextSpan(text: "Don't have an account? "),
                        TextSpan(
                          text: 'Sign Up',
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
      ),
    );
  }
}
