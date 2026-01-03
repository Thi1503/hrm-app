import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final IconThemeData? iconTheme;

  const BaseAppBar({
    super.key,
    required this.title,
    this.leading,
    this.centerTitle,
    this.actions,
    this.backgroundColor,
    this.iconTheme,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: backgroundColor,
      titleSpacing: 0,
      leading: leading,
      title: title,
      centerTitle: centerTitle,
      actions: actions,
      iconTheme: iconTheme,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
