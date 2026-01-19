import 'package:do_an_application/base/widgets/base_app_bar.dart';
import 'package:do_an_application/base/widgets/base_widget.dart';
import 'package:do_an_application/const/dimens.dart';
import 'package:do_an_application/features/propose/enums/request_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/register_leave_detail_controller.dart';

part 'register_leave_detail_widget.dart';

class RegisterLeaveDetailPage
    extends BaseGetWidget<RegisterLeaveDetailController> {
  RegisterLeaveDetailController get controller => _controller;

  late final _controller = Get.put(RegisterLeaveDetailController());

  RegisterLeaveDetailPage({super.key});

  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        title: 'Thông tin chi tiết',
        backgroundColor: const Color(0xFFFF6B35),
      ),
      body: _buildBody(),
    );
  }
}
