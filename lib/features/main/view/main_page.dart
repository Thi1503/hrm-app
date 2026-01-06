import 'package:do_an_application/assets.dart';
import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/dimens.dart';
import 'package:do_an_application/features/home/view/home_page.dart';
import 'package:do_an_application/features/individual/view/individual_page.dart';
import 'package:do_an_application/features/main/controller/main_controller.dart';
import 'package:do_an_application/features/manage/view/manage_page.dart';
import 'package:do_an_application/features/notification/view/notification_page.dart';
import 'package:do_an_application/features/propose/view/propose_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../const/colors.dart';

part 'main_widget.dart';

class MainPage extends BaseGetWidget<MainController> {
  MainController get controller => _controller;

  late final _controller = Get.put(MainController());

  MainPage({super.key});

  @override
  Widget buildWidgets() {
    return Obx(
      () => PopScope(
        canPop: controller.canPop.value,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            controller.handleBack();
          }
        },
        child: Scaffold(
          body: _buildBody(),
          bottomNavigationBar: _buildNavigationBar(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return TabBarView(
      controller: controller.tabCtrl,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        HomePage(),
        ProposePage(),
        NotificationPage(),
        ManagePage(),
        IndividualPage(),
      ],
    );
  }
}
