import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class KineticThemeExtension extends ThemeExtension<KineticThemeExtension> {
  final Decoration glassDecoration;
  final List<BoxShadow> softGlow;
  final LinearGradient primaryGradient;

  KineticThemeExtension({
    required this.glassDecoration,
    required this.softGlow,
    required this.primaryGradient,
  });

  @override
  KineticThemeExtension copyWith({
    Decoration? glassDecoration,
    List<BoxShadow>? softGlow,
    LinearGradient? primaryGradient,
  }) {
    return KineticThemeExtension(
      glassDecoration: glassDecoration ?? this.glassDecoration,
      softGlow: softGlow ?? this.softGlow,
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }

  @override
  KineticThemeExtension lerp(ThemeExtension<KineticThemeExtension>? other, double t) {
    if (other is! KineticThemeExtension) return this;
    return KineticThemeExtension(
      glassDecoration: Decoration.lerp(glassDecoration, other.glassDecoration, t)!,
      softGlow: BoxShadow.lerpList(softGlow, other.softGlow, t)!,
      primaryGradient: LinearGradient.lerp(primaryGradient, other.primaryGradient, t)!,
    );
  }
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        outline: AppColors.outline,
      ),
      textTheme: AppTypography.textTheme,
      
      // Theme Extensions for Kinetic Widgets (Adjusted for Light Mode)
      extensions: [
        KineticThemeExtension(
          glassDecoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8), // More opaque for light mode glass effect
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.outline, width: 1),
          ),
          softGlow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.05),
              blurRadius: 40,
              spreadRadius: 0,
            ),
          ],
          primaryGradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, Color(0xFF66BB6A)], // Green variants
          ),
        ),
      ],
      
      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: AppTypography.headlineLarge,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2, // Added slight elevation for light theme depth
        ),
      ),
      
      // Card Theme
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.outline, width: 1),
        ),
        margin: const EdgeInsets.all(8),
      ),
    );
  }

  // Renamed darkTheme to lightTheme for mission consistency if called globally
  static ThemeData get darkTheme => lightTheme; 
}
