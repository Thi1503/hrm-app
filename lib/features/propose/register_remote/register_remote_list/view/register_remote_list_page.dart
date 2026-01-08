import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/propose/register_remote/register_remote_list/controller/register_remote_list_controller.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'register_remote_list_widget.dart';

class RegisterRemoteListPage
    extends BaseGetWidget<RegisterRemoteListController> {
  const RegisterRemoteListPage({super.key});

  RegisterRemoteListController get controller =>
      Get.find<RegisterRemoteListController>();

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
                  _buildRemoteList(),
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
