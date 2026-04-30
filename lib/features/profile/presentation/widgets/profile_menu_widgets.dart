import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';

// ── Menu item model ────────────────────────────────────────────────────────────

class ProfileMenuItem {
  const ProfileMenuItem({
    required this.icon,
    required this.label,
    this.isDestructive = false,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isDestructive;
  final VoidCallback? onTap;
}

// ── Section divider ────────────────────────────────────────────────────────────

/// Thin hairline divider between menu groups.
class ProfileSectionDivider extends StatelessWidget {
  const ProfileSectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9));
  }
}

// ── Menu list ─────────────────────────────────────────────────────────────────

/// Renders a list of [ProfileMenuItem]s inside a card-style container.
class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({super.key, required this.items});

  final List<ProfileMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outline),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            if (i > 0) const ProfileSectionDivider(),
            _ProfileMenuTile(item: items[i]),
          ],
        ],
      ),
    );
  }
}

/// A single tappable row inside [ProfileMenuList].
class _ProfileMenuTile extends StatelessWidget {
  const _ProfileMenuTile({required this.item});
  final ProfileMenuItem item;

  Color _iconColor(bool isDestructive) =>
      isDestructive ? AppColors.error : AppColors.navSelected;

  Color _labelColor(bool isDestructive) =>
      isDestructive ? AppColors.error : AppColors.onSurface;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onTap,
      borderRadius: BorderRadius.circular(16),
      splashColor: AppColors.navSelected.withValues(alpha: 0.06),
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            // Icon in a soft container
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: item.isDestructive
                    ? AppColors.error.withValues(alpha: 0.08)
                    : AppColors.navSelected.withValues(alpha: 0.09),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                item.icon,
                size: 20,
                color: _iconColor(item.isDestructive),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                item.label,
                style: context.bodyLarge.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: _labelColor(item.isDestructive),
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: item.isDestructive
                  ? AppColors.error.withValues(alpha: 0.60)
                  : AppColors.hint,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
