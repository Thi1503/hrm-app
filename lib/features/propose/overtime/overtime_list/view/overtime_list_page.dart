import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/propose/overtime/overtime_list/controller/overtime_list_controller.dart';
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
