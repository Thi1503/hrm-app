import 'package:do_an_application/base/widgets/widgets.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/manage/controller/manage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'manage_widget.dart';

class ManagePage extends BaseGetWidget<ManageController> {
  ManageController get controller => _controller;

  late final _controller = Get.put(ManageController());

  ManagePage({super.key});

  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildGradientAppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: _buildManageItems(),
      ),
    );
  }
}
