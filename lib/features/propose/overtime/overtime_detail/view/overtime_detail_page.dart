import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/base/widgets/base_app_bar.dart';
import 'package:do_an_application/const/dimens.dart';
import 'package:do_an_application/features/propose/enums/request_status.dart';
import 'package:do_an_application/features/propose/overtime/overtime_detail/controller/overtime_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

part 'overtime_detail_widget.dart';

class OvertimeDetailPage extends BaseGetWidget<OvertimeDetailController> {
  OvertimeDetailController get controller => _controller;

  late final _controller = Get.put(OvertimeDetailController());

  OvertimeDetailPage({super.key});

  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: 'Chi tiết đơn OT'),
      body: _buildBody(),
      bottomNavigationBar:
          controller.isShowBottomActions ? _buildBottomActions() : null,
    );
  }
}
