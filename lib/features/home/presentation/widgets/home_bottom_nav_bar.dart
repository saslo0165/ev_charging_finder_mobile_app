import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_dimensions.dart';

/// A single bottom-navigation destination.
class NavItem {
  const NavItem({required this.iconAsset, required this.label});
  final String iconAsset;
  final String label;
}

/// The four destinations shown in the bottom nav.
const List<NavItem> kHomeNavItems = [
  NavItem(iconAsset: AppAssets.iconHome,    label: 'Home'),
  NavItem(iconAsset: AppAssets.iconVehicle, label: 'My Vehicle'),
  NavItem(iconAsset: AppAssets.iconBooking, label: 'Bookings'),
  NavItem(iconAsset: AppAssets.iconProfile, label: 'Profile'),
];

/// Fully custom bottom navigation bar + centered FAB built with [Stack].
///
/// Does NOT use [BottomAppBar] or Material FloatingActionButton — avoids all
/// Material 3 notch / tint / elevation issues completely.
class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.onFabTapped,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  final VoidCallback? onFabTapped;

  static const double _barHeight  = 70.0;
  static const double _fabDiameter = 60.0;
  static const double _totalHeight = _barHeight + (_fabDiameter / 2);

  @override
  Widget build(BuildContext context) {
    // Add bottom padding for home indicator (gesture nav bar on Android/iOS)
    final bottomPad = MediaQuery.of(context).padding.bottom;

    return SizedBox(
      height: _totalHeight + bottomPad,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // ── Nav bar panel ─────────────────────────────────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: _barHeight + bottomPad,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: AppColors.navBorder, width: 1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 12,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              padding: EdgeInsets.only(bottom: bottomPad),
              child: Row(
                children: [
                  Expanded(
                    child: _NavButton(
                        index: 0,
                        selectedIndex: selectedIndex,
                        onTap: onItemTapped),
                  ),
                  Expanded(
                    child: _NavButton(
                        index: 1,
                        selectedIndex: selectedIndex,
                        onTap: onItemTapped),
                  ),
                  // Gap where FAB sits — 68px keeps the FAB from overlapping text
                  const SizedBox(width: 68),
                  Expanded(
                    child: _NavButton(
                        index: 2,
                        selectedIndex: selectedIndex,
                        onTap: onItemTapped),
                  ),
                  Expanded(
                    child: _NavButton(
                        index: 3,
                        selectedIndex: selectedIndex,
                        onTap: onItemTapped),
                  ),
                ],
              ),
            ),
          ),

          // ── Centre FAB ────────────────────────────────────────────────────
          Positioned(
            top: 0,
            child: _CentreScanner(
              diameter: _fabDiameter,
              onTap: onFabTapped ?? () {},
            ),
          ),
        ],
      ),
    );
  }
}

// ── Centre scanner button ──────────────────────────────────────────────────────

class _CentreScanner extends StatelessWidget {
  const _CentreScanner({required this.diameter, required this.onTap});

  final double diameter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('--- FAB TAPPED ---');
        onTap();
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.fabCore,
          border: Border.all(color: Colors.white, width: 4),
          boxShadow: [
            BoxShadow(
              color: AppColors.fabCore.withValues(alpha: 0.40),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons.qr_code_scanner,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }
}

// ── Individual nav button ──────────────────────────────────────────────────────

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  final int index;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  bool get _isSelected => selectedIndex == index;
  Color get _color =>
      _isSelected ? AppColors.navSelected : AppColors.navUnselected;

  @override
  Widget build(BuildContext context) {
    final item = kHomeNavItems[index];
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              item.iconAsset,
              width: AppDimensions.navIconSize,
              height: AppDimensions.navIconSize,
              colorFilter: ColorFilter.mode(_color, BlendMode.srcIn),
            ),
            const SizedBox(height: 3),
            Text(
              item.label,
              style: TextStyle(
                fontSize: AppDimensions.navFontSize,
                color: _color,
                fontWeight:
                    _isSelected ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
