import 'package:do_an_application/base/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class UpdateAccountInfoController extends BaseGetxController {
  final birthDayCtrl = TextEditingController(
    text: convertDateToStringSafe(DateTime.now(), PATTERN_1),
  );
  final idCardCtrl = TextEditingController(text: '025202008581');
  final phoneCtrl = TextEditingController(text: '0384257775');
  final emailCtrl = TextEditingController(text: 'ledinhthi2k3@gmail.com');
  final addressCtrl = TextEditingController(text: 'Thường Tín, Hà Nội');

  // Quản lý giới tính
  final selectedGender = 'Nam'.obs;
  final List<String> genders = ['Nam', 'Nữ', 'Khác'];

  @override
  void onClose() {
    birthDayCtrl.dispose();
    idCardCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    addressCtrl.dispose();
    super.onClose();
  }

  void onConfirm() {
    Get.back();
  }
}
