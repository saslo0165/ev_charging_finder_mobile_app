import 'package:flutter/material.dart';

/// Standard spacing widgets to avoid hardcoded SizedBoxes everywhere.
class Gap extends StatelessWidget {
  final double size;
  const Gap(this.size, {super.key});

  @override
  Widget build(BuildContext context) => SizedBox(width: size, height: size);

  // Vertical Gaps
  static const h2 = SizedBox(height: 2);
  static const h4 = SizedBox(height: 4);
  static const h8 = SizedBox(height: 8);
  static const h12 = SizedBox(height: 12);
  static const h16 = SizedBox(height: 16);
  static const h20 = SizedBox(height: 20);
  static const h24 = SizedBox(height: 24);
  static const h28 = SizedBox(height: 28);
  static const h32 = SizedBox(height: 32);
  static const h40 = SizedBox(height: 40);
  static const h48 = SizedBox(height: 48);

  // Horizontal Gaps
  static const w4 = SizedBox(width: 4);
  static const w8 = SizedBox(width: 8);
  static const w12 = SizedBox(width: 12);
  static const w14 = SizedBox(width: 14);
  static const w16 = SizedBox(width: 16);
  static const w20 = SizedBox(width: 20);
  static const w24 = SizedBox(width: 24);
  static const w32 = SizedBox(width: 32);
}
