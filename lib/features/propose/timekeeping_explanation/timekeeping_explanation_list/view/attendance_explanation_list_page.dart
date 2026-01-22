import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/propose/enums/request_status.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/controller/attendance_explanation_list_controller.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/models/attendance_explantation_item.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:do_an_application/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'attendance_explanation_list_widget.dart';

class AttendanceExplanationListPage
    extends BaseGetWidget<AttendanceExplanationController> {
  const AttendanceExplanationListPage({super.key});

  // Getter controller tương tự các màn hình khác
  @override
  AttendanceExplanationController get controller =>
      Get.put(AttendanceExplanationController());

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
                  _buildExplanationList(), // Tab Của tôi (giữ nguyên)
                  _buildApproverList(), // Tab Tôi duyệt (thêm thông tin NV)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
