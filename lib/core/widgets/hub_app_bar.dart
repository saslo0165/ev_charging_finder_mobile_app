import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class HubAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final bool centerTitle;
  final TextStyle? titleStyle;
  final IconData backIcon;

  const HubAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.actions,
    this.centerTitle = false,
    this.titleStyle,
    this.backIcon = Icons.arrow_back,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: centerTitle,
      leading: showBackButton
          ? IconButton(
              icon: Icon(backIcon, size: 24, color: AppColors.onSurface),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(
        title,
        style:
            titleStyle ??
            AppTypography.headlineMedium.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: AppColors.onSurface,
            ),
      ),
      actions: actions,
    );
  }
}
