import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/register_leave/register_leave_detail/controller/register_leave_detail_controller.dart';
import 'package:do_an_application/utils/date_utils.dart';
import 'package:do_an_application/utils/formatter/date_full_input_formatter.dart';
import 'package:do_an_application/utils/widgets/app_select_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomActions(),
    );
  }
}
