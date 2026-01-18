import 'package:do_an_application/base/controllers/base_controller.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:do_an_application/utils/form_key_ext.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../application/app_controller.dart';
import '../models/login_request.dart';
import '../models/login_resoponse.dart';
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

  void login() async {
    autovalidateMode.value = AutovalidateMode.always;
    if (formKey.isValid) {
      try {
        showLoading();

        final request = LoginRequest(
          username: usernameTextCtrl.text.trim(),
          password: passwordTextCtrl.text.trim(),
        );

        final response = await loginRepository.login(request);

        if (response.isSuccess && response.data != null) {
          final loginData = LoginResponse.fromJson(response.data);
          // Lưu token vào storage
          // await appController.saveToken(loginData.accessToken);

          Get.toNamed(AppRoute.routeMain);
        } else {
          showSnackBar(response.message);
        }
      } catch (e) {
        logger.e('Login error: $e');
        showSnackBar('Đăng nhập thất bại. Vui lòng thử lại!');
      } finally {
        hideLoading();
      }
    }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    usernameTextCtrl.dispose();
    passwordTextCtrl.dispose();
    super.onClose();
  }
}
