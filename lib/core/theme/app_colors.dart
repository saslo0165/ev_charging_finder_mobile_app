import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary Palette
  static const Color primary = Color(0xFF4CAF50);
  static const Color background = Color(0xFFFFFFFF); // White for Light Theme
  static const Color surface = Color(0xFFF8F9FA);    // Soft Light Gray
  
  // Text Colors
  static const Color onSurface = Color(0xFF1E293B);        // Dark Navy/Slate
  static const Color onSurfaceVariant = Color(0xFF64748B); // Slate Grey
  static const Color hint = Color(0xFF94A3B8);
  
  // Border & Strokes
  static const Color outline = Color(0xFFE2E8F0); // Light border
  static const Color border = Color(0xFFE2E8F0);

  // Functional Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color secondary = Color(0xFF00BFA5);
  
  static const Color success = Color(0xFF4CAF50);
  static const Color surfaceVariant = Color(0xFFEFF6FF); // Very light blue-ish grey
  static const Color outlineVariant = Color(0xFFF1F5F9);
  
  // Range Ring Glow (Adjusted for Light Mode)
  static const Color rangeGlow = Color(0xFF3B82F6);
  static const Color rangeSecondaryGlow = Color(0xFFDBEAFE);
  
  // Legacy/Compatible surfaces
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFFBFBFB);
  static const Color surfaceContainerHigh = Color(0xFFF1F5F9);
  static const Color surfaceContainerHighest = Color(0xFFE2E8F0);
  // Navigation Bar
  static const Color navSelected   = Color(0xFF5A9E1A);
  static const Color navUnselected = Color(0xFF9E9E9E);
  static const Color navBorder     = Color(0xFFEEEEEE);

  // Floating Action Button rings
  static const Color fabHalo = Color(0x3385BF4F);  // ~20% translucent green
  static const Color fabCore = Color(0xFF5A9E1A);  // solid green centre

  // Referral banner
  static const Color bannerBackground = Color(0xFFD4EDAD);
  static const Color bannerAccent     = Color(0xFF5A9E1A);
  static const Color bannerDark       = Color(0xFF1A2E05);
}
