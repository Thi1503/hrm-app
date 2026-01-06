import 'package:do_an_application/assets.dart';
import 'package:do_an_application/const/enum/input_formatter_enum.dart';
import 'package:do_an_application/utils/sized_box/sized_box.dart';
import 'package:do_an_application/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/widgets/base_widget.dart';
import '../../../const/dimens.dart';
import '../login.dart';

part 'login_widget.dart';

class LoginPage extends BaseGetWidget<LoginController> {
  @override
  LoginController get controller => _controller;

  late final _controller = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget buildWidgets() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
    );
  }
}
