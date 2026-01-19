import 'package:do_an_application/base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterLeaveFormController extends BaseGetxController {
  final fromDateCtrl = TextEditingController();

  final toDateCtrl = TextEditingController();

  final reasonCtrl = TextEditingController();

  final countDayLeaveCtrl = TextEditingController();

  final leaveTypeSelected = ''.obs;
}
