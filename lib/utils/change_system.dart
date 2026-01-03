import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../application/app.dart';
import '../const/all_const.dart';

void changLanguage() {
  APP_DATA.read(AppConst.keyLanguageIsVN) ?? true
      ? Get.updateLocale(const Locale('vi', 'VN'))
      : Get.updateLocale(const Locale('en', 'US'));
}
