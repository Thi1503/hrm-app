import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/utils/date_utils.dart';
import 'package:flutter/material.dart';

class OvertimeFormController extends BaseGetxController {
  final overTimeDateCtrl = TextEditingController(
    text: convertDateToStringSafe(DateTime.now(), PATTERN_1),
  );

  final startHourCtrl = TextEditingController();

  final toTimeCtrl = TextEditingController();

  final countHourCtrl = TextEditingController();

  final reasonCtrl = TextEditingController();
}
