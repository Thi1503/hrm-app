import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/features/individual/worksheet/controller/worksheet_controller.dart';
import 'package:do_an_application/utils/sized_box/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/widgets/base_app_bar.dart';

part 'worksheet_widget.dart';

class WorksheetPage extends BaseGetWidget<WorksheetController> {
  const WorksheetPage({super.key});

  @override
  WorksheetController get controller => Get.put(WorksheetController());

  @override
  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: BaseAppBar(title: 'Bảng công tổng hợp'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildMonthSelector(),
            const SizedBox(height: 16),
            _buildSummaryGrid(),
          ],
        ),
      ),
    );
  }
}
