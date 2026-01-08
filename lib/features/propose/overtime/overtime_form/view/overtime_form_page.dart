import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/base/widgets/base_app_bar.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/propose/overtime/overtime_form/controller/overtime_form_controller.dart';
import 'package:do_an_application/utils/sized_box/sized_box.dart';
import 'package:do_an_application/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../const/dimens.dart';
import '../../../../../const/enum/input_formatter_enum.dart';

part 'overtime_form_widget.dart';

class OvertimeFormPage extends BaseGetWidget<OvertimeFormController> {
  OvertimeFormController get controller => _controller;

  late final _controller = Get.put(OvertimeFormController());
  OvertimeFormPage({super.key});

  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: 'Đăng ký làm thêm giờ'),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomActions(),
    );
  }
}
