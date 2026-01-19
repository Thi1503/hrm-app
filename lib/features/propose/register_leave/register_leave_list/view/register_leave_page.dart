import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/propose/enums/request_status.dart';
import 'package:do_an_application/features/propose/register_leave/register_detail/models/register_leave_detail_argument.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/controller/register_leave_controller.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/models/leave_request_item.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/models/leave_request_manager_item.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:do_an_application/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'register_leave_widget.dart';
part 'register_my_leaves_widget.dart';
part 'register_manager_leaves_widget.dart';

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
        appBar: buildAppBar(),
        body: Column(
          children: [
            buildFilterHeader(),
            Expanded(
              child: TabBarView(
                children: [
                  buildMyLeaveList(),
                  buildManagerLeaveList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
