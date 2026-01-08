import 'package:do_an_application/const/colors.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final IconThemeData? iconTheme;
  final bool? automaticallyImplyLeading;

  const BaseAppBar({
    super.key,
    required this.title,
    this.leading,
    this.centerTitle,
    this.actions,
    this.backgroundColor,
    this.iconTheme,
    this.automaticallyImplyLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: centerTitle ?? true,
      actions: actions,
      elevation: 0,
      iconTheme: iconTheme ?? IconThemeData(color: Colors.white),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.colorHeadPayroll,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
