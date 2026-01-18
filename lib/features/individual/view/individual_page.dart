import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/base/widgets/base_app_bar.dart';
import 'package:do_an_application/features/individual/controller/individual_controller.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'individual_widget.dart';

class IndividualPage extends BaseGetWidget<IndividualController> {
  @override
  IndividualController get controller => _controller;

  // Khởi tạo controller theo đúng mẫu ProposePage
  late final _controller = Get.put(IndividualController());

  IndividualPage({super.key});

  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        title: 'Cá nhân',
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              controller.logout();
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }


}
