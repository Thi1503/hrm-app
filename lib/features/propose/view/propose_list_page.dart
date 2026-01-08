import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/propose/controller/propose_list_controller.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProposePage extends BaseGetWidget<ProposeController> {
  ProposeController get controller => _controller;

  late final _controller = Get.put(ProposeController());
  ProposePage({super.key});

  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildGradientAppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildProposeItem(
            icon: Icons.event_available,
            iconColor: Colors.orange,
            title: 'Đăng ký nghỉ',
            onTap: () => Get.toNamed(AppRoute.routeRegisterLeave),
          ),
          _buildProposeItem(
            icon: Icons.calculate,
            iconColor: Colors.blue,
            title: 'Làm thêm giờ',
            onTap: () => Get.toNamed(AppRoute.routeOverTimeList),
          ),
          _buildProposeItem(
            icon: Icons.person_search,
            iconColor: Colors.deepPurple,
            title: 'Làm việc ngoài công ty, công tác',
            onTap: () => Get.toNamed(AppRoute.routeRegisterRemoteList),
          ),
          _buildProposeItem(
            icon: Icons.assignment_late_outlined,
            iconColor: Colors.deepOrangeAccent,
            title: 'Giải trình chấm công',
            onTap: () => Get.toNamed(AppRoute.routeTimekeepingExplanationList),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildGradientAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text(
        'Đề xuất',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.colorHeadPayroll,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  Widget _buildProposeItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    void Function()? onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            size: 24,
            color: Colors.black45,
          ),
          onTap: onTap,
        ),
        const Divider(
          height: 1,
          indent: 70,
          endIndent: 0,
          color: Color(0xFFEEEEEE),
        ),
      ],
    );
  }
}
