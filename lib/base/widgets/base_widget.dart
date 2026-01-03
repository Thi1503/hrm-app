import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../../utils/utils.dart';
import '../base.dart';

abstract class BaseGetWidget<T extends BaseGetxController> extends GetView<T> {
  const BaseGetWidget({super.key});

  Widget buildWidgets();

  @override
  Widget build(BuildContext context) {
    return buildWidgets();
    // WillPopScope(
    //   // tắt tính năng vuốt trái để back lại màn hình trước đó trên iphone
    //   onWillPop: () async {
    //     // KeyBoard.hide();
    //     // await 300.milliseconds.delay();
    //     return !Navigator.of(context).userGestureInProgress;
    //   },
    //   child:

    //    buildWidgets(),
    // );
  }

  Widget baseShowLoading(WidgetCallback child) {
    return Obx(
      () => controller.isShowLoading.value
          ? const Center(child: UtilWidgets.buildLoading)
          : child(),
    );
  }

  Widget baseSkeletonLoading(
    WidgetCallback childBuider, {
    required Widget skeleton,
  }) {
    return Obx(
      () => controller.isShowLoading.value ? skeleton : childBuider(),
    );
  }

  /// Widget cài đặt phần widget chính của page gồm cả phần shimmer loading và phần body.
  Widget baseShimmerLoading(WidgetCallback child, {Widget? shimmer}) {
    return Obx(
      () => controller.isShowLoading.value
          ? shimmer ?? UtilWidgets.buildShimmerLoading()
          : child(),
    );
  }

  Widget buildLoadingOverlay(WidgetCallback child) {
    return Obx(
      () => Stack(
        children: [
          LoadingOverlayPro(
            progressIndicator: !GetPlatform.isMobile
                ? const CupertinoActivityIndicator(
                    radius: 50,
                  )
                : UtilWidgets.buildLoading,
            isLoading: controller.isLoadingOverlay.value,
            bottomLoading: null,
            child: child(),
          ),
          if (controller.isIssueSuccess.value)
            Stack(
              children: [
                Container(
                  color: Colors.black38,
                ),
                Center(
                  child: SlitInVertical(
                    preferences: AnimationPreferences(
                      autoPlay: AnimationPlayStates.Forward,
                      duration: 500.milliseconds,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.lightGreenAccent,
                      size: Get.width / 2,
                    ),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}
