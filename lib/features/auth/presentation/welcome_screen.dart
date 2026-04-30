import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Gap.h48,
              Text(
                'Welcome to ChargeHub',
                style: context.titleLarge.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Gap.h12,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'You\'re almost there. To start ChargeHub you need to add your vehicle.',
                  style: context.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Center(
                child: Image.asset(
                  'assets/images/6201164_3206754 1.png',
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Knowing the vehicle helps provide accurate fare costs and personalize your experience',
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black.withValues(alpha: 0.8),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Gap.h32,
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => context.push('/add-vehicle'),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Gap.h40,
            ],
          ),
        ),
      ),
    );
  }
}
