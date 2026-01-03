import 'package:do_an_application/base/controllers/base_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../application/app_controller.dart';
import '../repository/login_repository.dart';

class LoginController extends BaseGetxController with WidgetsBindingObserver {
  late final loginRepository = LoginRepository(this);
  AppController appController = Get.find<AppController>();

  final formKey = GlobalKey<FormState>();
  final autovalidateMode = Rxn<AutovalidateMode>();
  final usernameTextCtrl = TextEditingController();
  final passwordTextCtrl = TextEditingController();
  final isHaveUsername = false.obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);

    super.onInit();
  }
}
