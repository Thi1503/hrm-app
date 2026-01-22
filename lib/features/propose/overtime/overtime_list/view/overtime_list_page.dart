import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/propose/overtime/overtime_list/controller/overtime_list_controller.dart';
import 'package:do_an_application/utils/date_utils.dart';
import 'package:do_an_application/utils/sized_box/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_route.dart';

part 'overtime_list_widget.dart';

class OvertimeListPage extends BaseGetWidget<OvertimeListController> {
  OvertimeListController get controller => _controller;

  late final _controller = Get.put(OvertimeListController());

  OvertimeListPage({super.key});

  @override
  Widget buildWidgets() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: _buildAppbar(),
        body: Column(
          children: [
            _buildFilterHeader(),
            Expanded(
              child: TabBarView(
                children: [
                  _buildOvertimeList(),
                  _buildApprovalList(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Get.toNamed(AppRoute.routeOverTimeForm);
            if (result == true) {
              controller.fetchOtRequests();
            }
          },
          backgroundColor: const Color(0xFFF97316),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
