import 'package:do_an_application/base/base.dart';
import 'package:flutter/material.dart';

class TimekeepingExplanationFormController extends BaseGetxController {
  final timekeepingDateCtrl = TextEditingController();
  final reasonCtrl = TextEditingController();

  void onClose() {
    timekeepingDateCtrl.dispose();
    reasonCtrl.dispose();
    super.onClose();
  }
}
