import 'package:do_an_application/base/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends BaseGetxController
    with GetSingleTickerProviderStateMixin {
  static const int initialIndex = 0;

  late final TabController tabCtrl = TabController(length: 5, vsync: this);

  final currentIndex = initialIndex.obs;
  final canPop = false.obs;

  void onTabTapped(int index) {
    if (index == currentIndex.value) return;

    currentIndex.value = index;
    canPop.value = index == initialIndex;
    tabCtrl.animateTo(index);
  }

  void handleBack() {
    if (currentIndex.value != initialIndex) {
      onTabTapped(initialIndex);
    } else {
      Get.back();
    }
  }

  @override
  void onClose() {
    tabCtrl.dispose();
    super.onClose();
  }
}
