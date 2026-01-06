import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/individual/controller/individual_controller.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'individual_widget.dart';

class IndividualPage extends BaseGetWidget<IndividualController> {
  IndividualController get controller => _controller;

  late final _controller = Get.put(IndividualController());

  IndividualPage({super.key});

  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildGradientAppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: _buildMenuItems(),
      ),
    );
  }
}
