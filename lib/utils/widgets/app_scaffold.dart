import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.bottomPadding,
    super.key,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;
  final double? bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        // Thêm padding bottom để UI không bị che bởi system navigation bar khi set SystemUiMode.edgeToEdge
        padding: EdgeInsets.only(
          bottom: bottomPadding ??
              (Platform.isAndroid ? Get.mediaQuery.viewPadding.bottom : 0),
        ),
        child: body,
      ),
      appBar: appBar,
      drawer: drawer,
      endDrawer: endDrawer,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
