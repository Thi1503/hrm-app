import 'package:flutter/services.dart';

import '../const/all_const.dart';
import 'utils.dart';

class CommaFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    if (text.isNotEmpty &&
        text[text.length - 1] == getDefaultFormatCurrency()) {
      text = text.replaceRange(text.length - 1, text.length,
          getDefaultFormatCurrency(isDot: !AppConst.isDot));
    }

    return newValue.copyWith(
      text: text,
    );
  }
}
