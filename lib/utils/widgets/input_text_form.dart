import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../assets.dart';
import '../../base/themes/app_text_style.dart';
import '../../const/colors.dart';
import '../../const/dimens.dart';
import '../utils.dart';

class BuildInputText extends StatefulWidget {
  final InputTextModel inputTextFormModel;

  const BuildInputText(this.inputTextFormModel, {super.key});

  @override
  State<BuildInputText> createState() => _BuildInputTextState();
}

class _BuildInputTextState extends State<BuildInputText> with FormatterEnum {
  final RxBool _isShowButtonClear = false.obs;
  final RxBool _showPassword = false.obs;

  @override
  void initState() {
    widget.inputTextFormModel.controller.addListener(() {
      if (widget.inputTextFormModel.controller.text.isNotEmpty) {
        _isShowButtonClear.value = true;
      }
    });
    _showPassword.value = widget.inputTextFormModel.obscureText;
    super.initState();
  }

  Widget? _suffixIcon() {
    if (widget.inputTextFormModel.suffixIcon != null) {
      return widget.inputTextFormModel.suffixIcon;
    }
    if (!_isShowButtonClear.value || widget.inputTextFormModel.isReadOnly) {
      return null;
    }
    return widget.inputTextFormModel.obscureText
        ? GestureDetector(
            onTap: () {
              _showPassword.toggle();
            },
            // child: Icon(
            //   _showPassword.value
            //       ? Icons.visibility_off_outlined
            //       : Icons.remove_red_eye_outlined,
            //   color: widget.inputTextFormModel.suffixColor ??
            //       AppColors.textColor(),
            // ),
            child: SvgPicture.asset(
              _showPassword.value
                  ? Assets.ASSETS_ICONS_IC_HIDE_PASSWORD_SVG
                  : Assets.ASSETS_ICONS_IC_SHOW_PASSWORD_SVG,
            ).paddingAll(AppDimens.paddingSmall),
          )
        : Visibility(
            visible: _isShowButtonClear.value &&
                !widget.inputTextFormModel.isReadOnly,
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(AppDimens.radius6),
              child: InkWell(
                borderRadius: BorderRadius.circular(AppDimens.radius6),
                onTap: () {
                  widget.inputTextFormModel.controller.clear();
                  _isShowButtonClear.value = false;
                  widget.inputTextFormModel.onChanged?.call("");
                },
                child: SvgPicture.asset(
                  Assets.ASSETS_ICONS_IC_CLEAR_SVG,
                ).paddingAll(AppDimens.paddingSmall),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        maxLines: widget.inputTextFormModel.maxLines,
        inputFormatters: getFormatters(widget.inputTextFormModel),
        validator: widget.inputTextFormModel.validator,
        autovalidateMode: widget.inputTextFormModel.autovalidateMode ??
            AutovalidateMode.onUserInteraction,
        onChanged: (v) {
          if (!_isShowButtonClear.value || v.isEmpty) {
            _isShowButtonClear.value = v.isNotEmpty;
          }
          widget.inputTextFormModel.onChanged?.call(v);
        },
        textInputAction: widget.inputTextFormModel.iconNextTextInputAction,
        style: AppTextStyle.font14Re.copyWith(
          color: widget.inputTextFormModel.textColor ?? AppColors.textColor(),
        ),
        controller: widget.inputTextFormModel.controller,
        obscureText: _showPassword.value,
        autofocus: widget.inputTextFormModel.autoFocus,
        focusNode: widget.inputTextFormModel.currentNode,
        keyboardType: widget.inputTextFormModel.textInputType,
        readOnly: widget.inputTextFormModel.isReadOnly,
        maxLength: widget.inputTextFormModel.maxLengthInputForm,
        textAlign: widget.inputTextFormModel.textAlign ?? TextAlign.start,
        onFieldSubmitted: (v) {
          if (widget.inputTextFormModel.iconNextTextInputAction.toString() ==
              TextInputAction.next.toString()) {
            FocusScope.of(context)
                .requestFocus(widget.inputTextFormModel.nextNode);

            widget.inputTextFormModel.onNext?.call(v);
          } else {
            widget.inputTextFormModel.submitFunc?.call(v);
          }
        },
        decoration: InputDecoration(
          counterText: widget.inputTextFormModel.isShowCounterText ? null : '',
          filled: true,
          fillColor: widget.inputTextFormModel.fillColor ??
              AppColors.textFieldFillColor,
          hintStyle: AppTextStyle.font14Re.copyWith(
            color: widget.inputTextFormModel.hintTextColor ??
                AppColors.textFieldHintColor,
          ),
          hintText: widget.inputTextFormModel.hintText,
          errorStyle: AppTextStyle.font12Re.copyWith(
            color: widget.inputTextFormModel.errorTextColor ??
                AppColors.errorTextField(),
          ),
          errorMaxLines: 2,
          prefixIcon: widget.inputTextFormModel.iconLeading != null
              ? Icon(
                  widget.inputTextFormModel.iconLeading,
                  color: widget.inputTextFormModel.prefixIconColor ??
                      AppColors.hintTextColor(),
                  size: 20,
                )
              : (widget.inputTextFormModel.iconAssets != null
                  ? SizedBox(
                      width: AppDimens.sizeIconDefault,
                      height: AppDimens.sizeIconDefault,
                      child: Center(
                        child: SvgPicture.asset(
                          widget.inputTextFormModel.iconAssets ?? "",
                          // colorFilter:
                          //     widget.inputTextFormModel.colorIconPrefix != null
                          //         ? ColorFilter.mode(
                          //             widget
                          //                 .inputTextFormModel.colorIconPrefix!,
                          //             BlendMode.srcIn)
                          //         : null,
                        ),
                      ),
                    )
                  : null),
          prefixStyle:
              const TextStyle(color: Colors.red, backgroundColor: Colors.white),
          border: widget.inputTextFormModel.border ?? InputBorder.none,
          contentPadding: widget.inputTextFormModel.contentPadding ??
              const EdgeInsets.all(AppDimens.paddingSmall),
          suffixIcon:
              widget.inputTextFormModel.showIconClear ? _suffixIcon() : null,
          focusedBorder:
              widget.inputTextFormModel.focusedBorder ?? _outlineInputBorder(),
          errorBorder: widget.inputTextFormModel.errorBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius6),
                borderSide: const BorderSide(color: Colors.red),
              ),
          enabledBorder:
              widget.inputTextFormModel.enabledBorder ?? _outlineInputBorder(),
          disabledBorder: widget.inputTextFormModel.disabledBorder,
          focusedErrorBorder: widget.inputTextFormModel.focusedErrorBorder ??
              _outlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimens.radius6),
      borderSide: BorderSide(
        color: AppColors.gray7,
      ),
    );
  }
}
