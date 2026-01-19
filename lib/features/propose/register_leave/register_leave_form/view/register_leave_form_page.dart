import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/base/widgets/base_app_bar.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/const/dimens.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_form/controller/register_leave_form_controller.dart';
import 'package:do_an_application/utils/sized_box/sized_box.dart';
import 'package:do_an_application/utils/widgets/app_select_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../const/enum/input_formatter_enum.dart';
import '../../../../../utils/utils.dart';

part 'register_leave_form_widget.dart';

class RegisterLeaveFormPage extends BaseGetWidget<RegisterLeaveFormController> {
  RegisterLeaveFormController get controller => _controller;

  late final _controller = Get.put(RegisterLeaveFormController());

  RegisterLeaveFormPage({super.key});

  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: 'Đăng ký nghỉ'),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomActions(),
    );
  }
}
