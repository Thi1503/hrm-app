import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/features/profile/models/my_info_response.dart';
import 'package:do_an_application/features/profile/repository/profile_repository.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

class ProfileController extends BaseGetxController
    with GetSingleTickerProviderStateMixin {
  late final ProfileRepository repository = ProfileRepository(this);
  late final tabCtrl = TabController(length: 2, vsync: this);

  late final tabIndex = RxInt(tabCtrl.index);

  final myInfoResponse = Rxn<MyInfoResponse>();

  @override
  void onInit() {
    fetchMyInfo();
    super.onInit();
  }

  Future<void> fetchMyInfo() async {
    try {
      showLoading();

      final response = await repository.getMyInfo();

      if (response.isSuccess && response.data != null) {
        myInfoResponse.value = MyInfoResponse.fromJson(response.data);
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoading();
    }
  }
}
