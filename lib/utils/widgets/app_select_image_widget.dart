import 'package:do_an_application/assets.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/const/dimens.dart';
import 'package:do_an_application/utils/sized_box/sized_box.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils.dart';

class AppSelectImageWidget extends StatelessWidget {
  const AppSelectImageWidget({
    super.key,
    required this.checkMaxImageAttachments,
    this.onTakePhoto,
    this.onPickImage,
  });

  final bool Function() checkMaxImageAttachments;
  final VoidCallback? onTakePhoto;
  final VoidCallback? onPickImage;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.colorBorder,
      strokeWidth: 2,
      dashPattern: [4, 4],
      borderType: BorderType.RRect,
      radius: const Radius.circular(16),
      child: InkWell(
        onTap: _showBottomSheetUploadOptions,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.colorWhite,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: AppDimens.padding24),
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset(Assets.ASSETS_ICONS_IC_UP_FILE_SVG),
                UtilWidgets.buildText(
                  'Tải lên file minh chứng',
                  textColor: AppColors.primary2,
                  fontSize: AppDimens.fontSmall(),
                ),
                UtilWidgets.buildText(
                  '[JPG,PNG,...]',
                  fontSize: AppDimens.fontSmall(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheetUploadOptions() {
    KeyBoard.hide();
    if (checkMaxImageAttachments()) {
      return;
    }
    Get.bottomSheet(
      UtilWidgets.buildBottomSheetFigma(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildUploadOption(
              icon: Icons.camera_alt_outlined,
              text: 'Chụp ảnh',
              onTap: onTakePhoto,
            ),
            const Divider(height: 1),
            _buildUploadOption(
              icon: Icons.image_outlined,
              text: 'Chọn ảnh từ thư viện',
              onTap: onPickImage,
            ),
            sdsSBHeight16,
          ],
        ),
      ),
    );
  }

  Widget _buildUploadOption({
    required IconData icon,
    required String text,
    required VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Get.back();
          onTap?.call();
        },
        child: Row(
          children: [
            Icon(icon),
            sdsSBWidth8,
            Expanded(
              child: UtilWidgets.buildText(
                text,
                fontSize: AppDimens.fontMedium(),
              ),
            ),
          ],
        ).paddingSymmetric(vertical: AppDimens.defaultPadding),
      ),
    );
  }
}
