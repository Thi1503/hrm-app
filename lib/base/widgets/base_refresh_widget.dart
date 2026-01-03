import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets.dart';
import '../../const/all_const.dart';
import '../../utils/utils.dart';
import '../base.dart';

abstract class BaseRefreshWidget<T extends BaseRefreshGetxController>
    extends BaseGetWidget<T> {
  const BaseRefreshWidget({super.key});

  Widget buildPage({
    PreferredSizeWidget? appBar,
    required Widget body,
    double miniumBottom = 0,
    RxBool? isShowSupportCus,
    Color? statusBarColor,
    bool isNeedUpToPage = false,
    double upToBottomPadding = 0.0,
  }) {
    Rx<Offset> position = Offset(Get.width - 50, Get.height / 2 + 100).obs;
    RxBool? isDraging = false.obs;

    isShowSupportCus ??= false.obs;

    return Container(
      color: AppColors.orange,
      // child: UtilWidgets.buildSafeArea(),
      child: Obx(
        () => Stack(
          alignment: Alignment.bottomRight,
          children: [
            AppScaffold(
              appBar: appBar,
              body: body,
              floatingActionButton: isNeedUpToPage &&
                      controller.showBackToTopButton.value
                  ? Container(
                      padding: EdgeInsets.only(bottom: upToBottomPadding),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          height: 45,
                          width: 45,
                          child: FittedBox(
                            child: FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                controller.scrollControllerUpToTop.animateTo(0,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn);
                              },
                              backgroundColor: AppColors.primary2,
                              child: const Icon(
                                Icons.keyboard_arrow_up,
                                size: AppDimens.sizeIconSpinner,
                                color: AppColors.textColorWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
            Positioned(
              top: position.value.dy,
              left: position.value.dx,
              child: Draggable(
                data: 1,
                feedback: UtilWidgets.buildButtonIcon(
                  sizeIcon: 30,
                  icons: Icons.headset_off_rounded,
                  iconColor: Colors.white,
                  func: () {},
                  colors: AppColors.colorRed444,
                  title: '',
                  imgAsset: Assets.ASSETS_ICONS_ICON_SUP_PNG,
                ),
                childWhenDragging: Container(),
                onDraggableCanceled: (Velocity velocity, Offset offset) {
                  position.value = offset;
                  isDraging.value = false;
                },
                onDragStarted: () {
                  isDraging.value = true;
                },
                onDragEnd: (drag) {
                  isDraging.value = false;
                },
                child: Obx(
                  () => Visibility(
                    visible: isShowSupportCus?.value ?? false,
                    child: Container(
                      color: Colors.transparent,
                      height: 65,
                      child: UtilWidgets.buildButtonIcon(
                        sizeIcon: 30,
                        icons: Icons.headset_mic,
                        func: () {
                          ShowPopup.openSupport();
                        },
                        colors: AppColors.orange,
                        title: '',
                        imgAsset: Assets.ASSETS_ICONS_ICON_SUP_PNG,
                      ),
                    ).paddingOnly(right: AppDimens.paddingSmall),
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.only(
                bottom: GetPlatform.isIOS
                    ? AppDimens.paddingHuge * 2
                    : AppDimens.paddingHuge,
              ),
              alignment: AlignmentDirectional.bottomCenter,
              child: Obx(
                () => Visibility(
                  visible: isDraging.value,
                  child: DragTarget(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return Container(
                        padding: const EdgeInsetsDirectional.only(
                            bottom: AppDimens.paddingHuge),
                        child: CircleAvatar(
                          backgroundColor: AppColors.hintTextColor(),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ).paddingOnly(bottom: 20);
                    },
                    onAcceptWithDetails: (data) {
                      isShowSupportCus?.value = false;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
