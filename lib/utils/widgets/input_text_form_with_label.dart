import 'package:flutter/widgets.dart';

import '../../base/themes/app_text_style.dart';
import '../../const/colors.dart';
import '../../const/dimens.dart';
import '../utils.dart';

class BuildInputTextWithLabel extends StatelessWidget {
  final InputTextModel inputTextModel;
  final String label;
  final bool isRequired;
  final TextStyle? labelStyle;

  const BuildInputTextWithLabel({
    super.key,
    required this.label,
    required this.inputTextModel,
    this.isRequired = false,
    this.labelStyle,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: UtilWidgets.buildText(
                label,
                style: labelStyle ??
                    AppTextStyle.font16Bo.copyWith(
                      color: AppColors.gray1,
                    ),
              ),
            ),
            UtilWidgets.buildText(
              isRequired ? ' *' : '',
              style: labelStyle?.copyWith(
                    color: AppColors.primary2,
                  ) ??
                  AppTextStyle.font16Bo.copyWith(
                    color: AppColors.primary2,
                  ),
            ),
          ],
        ),
        const SizedBox(
          height: AppDimens.paddingVerySmall,
        ),
        BuildInputText(inputTextModel),
      ],
    );
  }
}
