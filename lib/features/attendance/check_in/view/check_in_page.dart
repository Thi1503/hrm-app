import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/base/widgets/base_app_bar.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/attendance/check_in/controller/check_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

part 'check_in_widget.dart';

class CheckInPage extends BaseGetWidget<CheckInController> {
  final bool isCheckOut;

  CheckInPage({super.key, this.isCheckOut = false});

  @override
  CheckInController get controller => Get.put(CheckInController());

  @override
  Widget buildWidgets() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        title: isCheckOut ? 'Check-out' : 'Check-in',
        backgroundColor: AppColors.primary2,
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomAction(),
    );
  }
}
