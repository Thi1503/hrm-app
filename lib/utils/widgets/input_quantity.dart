import 'package:do_an_application/const/enum/input_formatter_enum.dart';
import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/dimens.dart';
import '../utils.dart';

class SDSInputQuantity extends StatelessWidget {
  final TextEditingController valCtrl;
  final double steps;
  final double maxVal;
  final FocusNode? focusNode;
  final bool defaultSize;
  final Function() function;
  final int? lastDecimal;
  final double? customWidth;
  final bool isBlockTap;

  const SDSInputQuantity({
    super.key,
    required this.valCtrl,
    required this.function,
    this.steps = 1,
    this.maxVal = double.maxFinite,
    this.focusNode,
    this.defaultSize = false,
    this.lastDecimal,
    this.customWidth,
    this.isBlockTap = false,
  });

  @override
  Widget build(BuildContext context) {
    setPointerAfterText(valCtrl);
    double value = CurrencyUtils.formatNumberCurrency(valCtrl.text);

    return SDSContainerBorder(
      width: AppDimens.widthChip,
      height: AppDimens.heightChip,
      color: AppColors.appBarBackgroundColor,
      radius: AppDimens.paddingVerySmall,
      borderColor: AppColors.appBarBackgroundColor,
      child: Row(
        children: [
          _buildIconButton(
            icon: Icons.remove,
            onPressed: minus,
            color: AppColors.cardBackgroundColor(),
            iconColor: AppColors.primary2,
            padding: EdgeInsets.zero,
          ),
          SizedBox(
            width: AppDimens.width35,
            height: AppDimens.height30,
            child: BuildInputText(
              InputTextModel(
                controller: valCtrl,
                textColor: AppColors.colorTextNumber,
                textSize: AppDimens.fontSmall(),
                contentPadding: EdgeInsets.zero,
                textInputType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: InputFormatterEnum.decimalNumber,
                textAlign: TextAlign.center,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.colorTransparent),
                ),
                fillColor: AppColors.appBarBackgroundColor,
                showIconClear: false,
                onChanged: (val) {
                  setPointerAfterText(valCtrl);
                  value = CurrencyUtils.formatNumberCurrency(valCtrl.text);
                  val.isEmpty
                      ? function()
                      : buildInputDefault(
                          valCtrl,
                          valCtrl.text,
                          lastDecimal: lastDecimal,
                        );
                  if (value != 0) {
                    function();
                  }
                },
                onTap: () {
                  valCtrl.selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: valCtrl.value.text.length,
                  );
                },
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
          _buildIconButton(
            icon: Icons.add,
            onPressed: plus,
            iconColor: AppColors.cardBackgroundColor(),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData? icon,
    required Function()? onPressed,
    EdgeInsetsGeometry? padding,
    Color? iconColor,
    Color? color,
  }) {
    return InkWell(
      onTap: isBlockTap ? null : onPressed,
      child: Container(
        height: 28,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color ?? AppColors.primary2,
          border: Border.all(
            color: AppColors.primary2,
          ),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 24,
        ),
      ),
    );
  }

  void buildInputDefault(
    TextEditingController textEditingController,
    String value, {
    int? lastDecimal,
    dynamic customMaxValue,
  }) {
    textEditingController
      ..text = CurrencyUtils.formatCurrencyForeign(
        value,
        lastDecimal: lastDecimal ?? 6,
        customMaxValue: customMaxValue,
      )
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: CurrencyUtils.formatCurrencyForeign(
            value,
            lastDecimal: lastDecimal ?? 6,
            customMaxValue: customMaxValue,
          ).length,
        ),
      );
  }

  void setPointerAfterText(
    TextEditingController textEditingController,
  ) {
    textEditingController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: textEditingController.text.length,
      ),
    );
  }

  void minus() {
    double value = CurrencyUtils.formatNumberCurrency(valCtrl.text);
    if (value > 0) {
      if (value < steps) {
        value = 0;
      } else {
        value -= steps;
      }
    } else {
      value = 1;
    }
    valCtrl.text = CurrencyUtils.formatCurrencyForeign(
      value,
      lastDecimal: lastDecimal,
    );

    function();
  }

  void plus() {
    double value = CurrencyUtils.formatNumberCurrency(valCtrl.text);
    if (value < maxVal && valCtrl.text.isNotEmpty) {
      value += steps;
    } else {
      value = 1;
    }
    valCtrl.text = CurrencyUtils.formatCurrencyForeign(
      value,
      lastDecimal: lastDecimal,
    );
    function();
  }
}
