import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ev_charging_finder/features/auth/presentation/providers/auth_notifier.dart';
import 'package:ev_charging_finder/features/auth/presentation/providers/auth_state.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _controller.forward();
    _navigateToNext();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _navigateToNext() async {
    // 1. Minimum delay for branding (logo visibility)
    final minDelay = Future.delayed(const Duration(seconds: 2));

    debugPrint('DEBUG: SplashScreen waiting for auth state...');
    // 2. Wait for auth state to stop being loading (restoration complete)
    // We poll with a timeout (10 seconds) to prevent hanging
    int attempts = 0;
    while (ref.read(authProvider).isLoading && attempts < 100) {
      await Future.delayed(const Duration(milliseconds: 100));
      attempts++;
    }

    final authState = ref.read(authProvider).value;
    debugPrint('DEBUG: SplashScreen auth state ready: $authState after ${attempts * 100}ms');

    await minDelay;

    if (mounted) {
      if (authState is AuthAuthenticated) {
        debugPrint('DEBUG: Navigating to Home');
        context.go('/');
      } else {
        debugPrint('DEBUG: Navigating to Onboarding (State: $authState)');
        context.go('/onboarding');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Hero(
          tag: 'app_logo',
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ),
      ),
    );
  }
}
