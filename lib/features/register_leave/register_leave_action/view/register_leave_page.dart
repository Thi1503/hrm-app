import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/register_leave/register_leave_action/controller/register_leave_controller.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'register_leave_widget.dart';

class RegisterLeavePage extends BaseGetWidget<RegisterLeaveController> {
  RegisterLeaveController get controller => _controller;

  late final _controller = Get.put(RegisterLeaveController());
  RegisterLeavePage({super.key});

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
                  _buildLeaveList(), // Danh sách "Của tôi"
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
