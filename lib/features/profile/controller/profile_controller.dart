import 'package:do_an_application/base/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

class ProfileController extends BaseGetxController
    with GetSingleTickerProviderStateMixin {
  late final tabCtrl = TabController(length: 3, vsync: this);

  late final tabIndex = RxInt(tabCtrl.index);
}
