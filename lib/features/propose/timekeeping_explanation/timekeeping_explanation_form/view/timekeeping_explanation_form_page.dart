import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/base/widgets/base_app_bar.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_form/controller/timekeeping_explanation_form_controller.dart';
import 'package:do_an_application/utils/sized_box/sized_box.dart';
import 'package:do_an_application/utils/widgets/app_select_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../const/colors.dart';
import '../../../../../const/dimens.dart';
import '../../../../../const/enum/input_formatter_enum.dart';
import '../../../../../utils/utils.dart';

part 'timekeeping_explanation_form_widget.dart';

class TimekeepingExplanationFormPage
    extends BaseGetWidget<TimekeepingExplanationFormController> {
  const TimekeepingExplanationFormPage({super.key});

  // Getter controller tương tự các màn hình khác
  @override
  TimekeepingExplanationFormController get controller =>
      Get.put(TimekeepingExplanationFormController());

  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        title: 'Giải trình chấm công',
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomActions(),
    );
  }
}
