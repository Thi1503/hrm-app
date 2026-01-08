import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/base/widgets/base_app_bar.dart';
import 'package:do_an_application/utils/sized_box/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/colors.dart';
import '../../../const/enum/input_formatter_enum.dart';
import '../../../utils/utils.dart';
import '../controller/update_account_info_controller.dart';

part 'update_account_info_widget.dart';

class UpdateAccountInfoPage extends BaseGetWidget<UpdateAccountInfoController> {
  const UpdateAccountInfoPage({super.key});

  @override
  UpdateAccountInfoController get controller =>
      Get.put(UpdateAccountInfoController());

  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        title: 'Cập nhật thông tin',
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomButton(),
    );
  }
}
