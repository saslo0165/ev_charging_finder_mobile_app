import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_typography.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),

              // Center Image - Charger Station
              Center(
                child: Image.asset(
                  'assets/images/charger_station.png',
                  height: MediaQuery.of(context).size.height * 0.45,
                  fit: BoxFit.contain,
                ),
              ),

              const Spacer(flex: 2),

              // Text Content
              Text(
                'Charge Anywhere',
                style: AppTypography.displayLarge.copyWith(
                  color: const Color(0xFF1E293B), // Dark Navy/Slate
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'Find and access EV charging stations effortlessly. Keep your electric vehicle powered up wherever.',
                style: AppTypography.bodyLarge.copyWith(
                  color: const Color(0xFF64748B), // Slate Grey
                  fontSize: 16,
                  height: 1.6,
                ),
              ),

              const Spacer(flex: 1),

              // Get Started Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => context.go('/login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF85BF4F,
                    ), // Natural Green from mockup
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: AppTypography.buttonLarge.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
