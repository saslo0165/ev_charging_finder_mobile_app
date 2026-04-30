import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract class AppTypography {
  // Display styles - nunitoSans
  static TextStyle get displayLarge => GoogleFonts.nunitoSans(
        fontSize: 56,
        fontWeight: FontWeight.w700,
        height: 1.1,
        color: AppColors.onSurface,
      );

  static TextStyle get headlineMedium => GoogleFonts.nunitoSans(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: AppColors.onSurface,
      );

  static TextStyle get titleLarge => GoogleFonts.nunitoSans(
        fontSize: 22,
        fontWeight: FontWeight.w800, // Increased weight for light theme clarity
        color: AppColors.onSurface,
      );

  // Custom typography for Figma tokens
  static TextStyle get headlineLarge => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.1,
        color: AppColors.onSurface,
      );

  // Body styles
  static TextStyle get bodyLarge => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColors.onSurface, // Using onSurface for primary body readability
      );

  static TextStyle get bodyMedium => GoogleFonts.nunitoSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColors.onSurfaceVariant,
      );

  static TextStyle get bodySmall => GoogleFonts.nunitoSans(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColors.onSurfaceVariant,
      );

  static TextStyle get labelSmall => GoogleFonts.nunitoSans(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.05,
        color: AppColors.onSurfaceVariant,
      );

  static TextStyle get labelSmallUppercase => labelSmall.copyWith(
        letterSpacing: 1.1,
      );

  static TextStyle get buttonLarge => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        color: Colors.white, // White text on Green button
      );

  static TextTheme get textTheme => TextTheme(
        displayLarge: displayLarge,
        headlineMedium: headlineMedium,
        headlineLarge: headlineLarge,
        titleLarge: titleLarge,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelSmall: labelSmall,
      );
}

extension AppTypographyExtension on BuildContext {
  TextTheme get appTextTheme => Theme.of(this).textTheme;
  
  TextStyle get displayLarge => AppTypography.displayLarge;
  TextStyle get headlineMedium => AppTypography.headlineMedium;
  TextStyle get titleLarge => AppTypography.titleLarge;
  TextStyle get headlineLarge => AppTypography.headlineLarge;
  TextStyle get bodyLarge => AppTypography.bodyLarge;
  TextStyle get bodyMedium => AppTypography.bodyMedium;
  TextStyle get bodySmall => AppTypography.bodySmall;
  TextStyle get labelSmall => AppTypography.labelSmall;
  TextStyle get labelSmallUppercase => AppTypography.labelSmallUppercase;
  TextStyle get buttonLarge => AppTypography.buttonLarge;
}
