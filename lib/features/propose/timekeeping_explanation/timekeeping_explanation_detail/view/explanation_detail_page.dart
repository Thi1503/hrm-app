import 'package:do_an_application/base/widgets/base_app_bar.dart';
import 'package:do_an_application/base/widgets/base_widget.dart';
import 'package:do_an_application/const/dimens.dart';
import 'package:do_an_application/features/propose/enums/request_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/explanation_detail_controller.dart';

part 'explanation_detail_widget.dart';

class ExplanationDetailPage extends BaseGetWidget<ExplanationDetailController> {
  ExplanationDetailController get controller => _controller;

  late final _controller = Get.put(ExplanationDetailController());

  ExplanationDetailPage({super.key});

  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        title: 'Thông tin chi tiết',
        backgroundColor: const Color(0xFFFF6B35),
      ),
      body: _buildBody(),
      bottomNavigationBar:
          controller.isShowBottomActions ? _buildBottomActions() : null,
    );
  }
}
