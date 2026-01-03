import 'package:do_an_application/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../application/app_controller.dart';
import '../../assets.dart';
import '../../const/colors.dart';
import '../../const/dimens.dart';

class SplashPage extends GetView<AppController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppController(), permanent: true);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: (AppColors.isDarkMode
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark)
          .copyWith(
        statusBarColor: AppColors.loginBgColor,
      ),
      child: AppScaffold(
        body: Container(
          alignment: Alignment.center,
          color: AppColors.colorWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UtilWidgets.buildLogo(
                Assets.ASSETS_IMAGES_ICON_HRM_PNG,
                AppDimens.sizeImageLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
