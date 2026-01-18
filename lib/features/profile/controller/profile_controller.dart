import 'package:do_an_application/application/app_controller.dart';
import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/features/profile/models/my_info_response.dart';
import 'package:do_an_application/features/profile/repository/profile_repository.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends BaseGetxController
    with GetSingleTickerProviderStateMixin {
  late final ProfileRepository repository = ProfileRepository(this);
  late final AppController appController = Get.find<AppController>();
  late final tabCtrl = TabController(length: 2, vsync: this);

  late final tabIndex = RxInt(tabCtrl.index);

  @override
  void onInit() {
    fetchMyInfo();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // Reload data khi quay lại từ màn update
  }

  Future<void> fetchMyInfo() async {
    try {
      showLoading();

      final response = await repository.getMyInfo();

      if (response.isSuccess && response.data != null) {
        appController.myInfoResponse.value = MyInfoResponse.fromJson(response.data);
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoading();
    }
  }

  Future<void> refreshData() async {
    await fetchMyInfo();
  }
}
