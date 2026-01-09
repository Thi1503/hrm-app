import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/base/widgets/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../const/colors.dart';
import '../../../../../const/dimens.dart';
import '../../../../../const/enum/input_formatter_enum.dart';
import '../../../../../utils/sized_box/sized_box.dart';
import '../../../../../utils/utils.dart';
import '../controller/register_remote_form_controller.dart';

part 'register_remote_form_widget.dart';

class RegisterRemoteFormPage
    extends BaseGetWidget<RegisterRemoteFormController> {
  const RegisterRemoteFormPage({super.key});

  // Getter controller như các màn hình khác
  @override
  RegisterRemoteFormController get controller =>
      Get.put(RegisterRemoteFormController());

  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        title: 'Đăng ký làm việc ngoài công ty, công tác',
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomActions(),
    );
  }
}
