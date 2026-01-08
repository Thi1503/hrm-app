import 'package:do_an_application/const/dimens.dart';
import 'package:do_an_application/utils/utils.dart';
import 'package:flutter/material.dart';

abstract class ButtonUtils {
  static Widget buildElevatedButton({
    required String label,
    IconData? icon,
    double? width,
    double? height,
    bool showLoading = false,
    Color? borderColor,
    Color? backgroundColor,
    Color? foregroundColor,
    VoidCallback? onPressed,
  }) {
    final child = UtilWidgets.buildText(
      label,
      textColor: foregroundColor,
    );
    final holder = SizedBox.square(
      dimension: AppDimens.btnSmall,
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor,
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(foregroundColor),
      ),
    );
    final style = ElevatedButton.styleFrom(
      fixedSize: Size(
        width ?? 100,
        height ?? AppDimens.sizeDialogNotiIcon,
      ),
      shape: RoundedRectangleBorder(
        side: borderColor == null
            ? BorderSide.none
            : BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(
          AppDimens.radius12,
        ),
      ),
      elevation: 0,
      padding: EdgeInsets.zero,
      backgroundColor: backgroundColor,
    );
    if (icon == null) {
      return ElevatedButton(
        style: style,
        onPressed: showLoading ? null : onPressed,
        child: showLoading ? holder : child,
      );
    }
    return ElevatedButton.icon(
      style: style,
      onPressed: showLoading ? null : onPressed,
      label: showLoading ? holder : child,
      icon: Icon(icon),
    );
  }
}
