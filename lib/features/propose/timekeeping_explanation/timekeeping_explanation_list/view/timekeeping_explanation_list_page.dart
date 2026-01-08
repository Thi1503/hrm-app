import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/controller/timekeeping_explanation_list_controller.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'timekeeping_explanation_list_widget.dart';

class TimekeepingExplanationListPage
    extends BaseGetWidget<TimekeepingExplanationListController> {
  const TimekeepingExplanationListPage({super.key});

  // Getter controller tương tự các màn hình khác
  @override
  TimekeepingExplanationListController get controller =>
      Get.put(TimekeepingExplanationListController());

  @override
  Widget buildWidgets() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: _buildAppBar(),
        body: Column(
          children: [
            _buildFilterHeader(),
            Expanded(
              child: TabBarView(
                children: [
                  _buildExplanationList(),
                  const Center(child: Text('Danh sách Tôi duyệt')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
