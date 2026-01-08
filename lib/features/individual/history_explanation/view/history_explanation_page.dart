import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/dimens.dart';
import 'package:do_an_application/features/individual/history_explanation/controller/history_explanation_controller.dart';
import 'package:do_an_application/utils/sized_box/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../base/widgets/base_app_bar.dart';
import '../../../../const/colors.dart';

part 'history_explanation_widget.dart';

class HistoryExplanationPage
    extends BaseGetWidget<HistoryExplanationController> {
  const HistoryExplanationPage({super.key});

  @override
  HistoryExplanationController get controller =>
      Get.put(HistoryExplanationController());

  @override
  Widget buildWidgets() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: BaseAppBar(title: 'Lịch sử chấm công'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildFilters(),
              _buildCalendar(),
              _buildSummaryBadges(),
              _buildActionHeaders(),
              _buildStatusDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
