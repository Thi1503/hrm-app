import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/all_const.dart';
import 'util_widgets.dart';

class SDSContainerBorder extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final Color? borderColor;
  final bool isNoBorder;
  final List<BoxShadow>? boxShadows;
  final Function()? onTap;
  const SDSContainerBorder({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.radius,
    this.color,
    this.borderColor,
    this.isNoBorder = false,
    this.boxShadows,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? Get.width,
        height: height ?? Get.height,
        decoration: BoxDecoration(
          color: color ?? AppColors.lightAccentColor,
          border: isNoBorder
              ? null
              : Border.all(
                  color: borderColor ?? AppColors.lightPrimaryColor,
                ),
          boxShadow: boxShadows,
          borderRadius: BorderRadius.all(
            Radius.circular(
              radius ?? AppDimens.paddingVerySmall,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}

class SDSButtonBorder extends StatelessWidget {
  final String title;
  final Function() func;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? padding;
  final double? paddingText;
  final double? fontSize;
  final TextAlign? textAlign;
  final AlignmentGeometry? alignment;

  const SDSButtonBorder(
    this.title,
    this.func, {
    super.key,
    this.textColor,
    this.borderColor,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    this.paddingText,
    this.fontSize,
    this.textAlign,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return UtilWidgets.baseOnAction(
      onTap: func,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? AppDimens.btnDefault,
        child: SDSContainerBorder(
          borderColor: borderColor,
          radius: borderRadius,
          color: AppColors.textColorWhite,
          child: Align(
            alignment: alignment ?? Alignment.center,
            child: UtilWidgets.buildText(
              title,
              fontWeight: FontWeight.w600,
              fontSize: fontSize ?? 14,
              textColor: textColor ?? Colors.black,
              textAlign: textAlign,
            ).paddingAll(
              paddingText ?? 0,
            ),
          ),
        ),
      ),
    );
  }
}
