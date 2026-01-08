import 'package:do_an_application/base/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';

class RegisterRemoteFormController extends BaseGetxController {
  final registerRemoteCtrl = TextEditingController(
    text: convertDateToStringSafe(DateTime.now(), PATTERN_1),
  );

    final registerRemoteType = ''.obs;

  final reasonCtrl = TextEditingController();
}
