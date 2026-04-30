import 'package:flutter/material.dart';

/// Shared layout tokens — spacing, sizing, radii.
///
/// Use these instead of hard-coded literals so resizing a card or changing
/// the page padding is a one-line change.
abstract class AppDimensions {
  AppDimensions._();

  // ── Page layout ────────────────────────────────────────────────────────────
  static const double pageHorizontalPadding = 20.0;
  static const double pageVerticalPadding   = 16.0;

  // ── Card radii ─────────────────────────────────────────────────────────────
  static const double cardRadius  = 20.0;
  static const double chipRadius  = 12.0;
  static const double inputRadius = 30.0;

  // ── Home-screen card heights ───────────────────────────────────────────────
  static const double mapCardHeight    = 280.0;
  static const double bannerCardHeight = 160.0;

  // ── Bottom navigation ──────────────────────────────────────────────────────
  static const double navIconSize  = 26.0;
  static const double navFabGap    = 64.0;   // keeps symmetry with FAB halo
  static const double navFontSize  = 11.0;
  static const EdgeInsets navItemPadding =
      EdgeInsets.symmetric(horizontal: 10, vertical: 6);

  // ── FAB (triple-ring) ──────────────────────────────────────────────────────
  static const double fabHaloSize  = 72.0;
  static const double fabRingSize  = 60.0;
  static const double fabCoreSize  = 52.0;
  static const double fabIconSize  = 28.0;
  static const double fabNotchMargin = 6.0;
}
