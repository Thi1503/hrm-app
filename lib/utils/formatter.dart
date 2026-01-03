import 'package:flutter/services.dart';

import '../const/const.dart';
import '../const/string_value.dart';

String formatInvoiceNo(num number) {
  String invoiceNo = number.toInt().toString();

  if (invoiceNo.isEmpty) {
    return '';
  }
  final int count = 7 - invoiceNo.length;

  for (int index = 0; index < count; index++) {
    invoiceNo = '0$invoiceNo';
  }
  return invoiceNo;
}

class MaxNumberFormatter extends TextInputFormatter {
  final int maxValue;
  final int minValue;
  MaxNumberFormatter(this.maxValue, this.minValue);
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '') {
      return const TextEditingValue(text: "");
    } else if ((int.tryParse(newValue.text) ?? 0) < minValue) {
      return const TextEditingValue().copyWith(text: '$minValue');
    }

    return (int.tryParse(newValue.text) ?? 0) > maxValue
        ? const TextEditingValue().copyWith(text: '$maxValue')
        : newValue;
  }
}

String twoDigits(int n) {
  if (n >= 10) return '$n';
  return '0$n';
}

String formatBySeconds(Duration duration) =>
    twoDigits(duration.inSeconds.remainder(60));

String formatByMinutes(Duration duration) {
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  return '$twoDigitMinutes:${formatBySeconds(duration)}';
}

String formatByHours(Duration duration) {
  return '${twoDigits(duration.inHours)}:${formatByMinutes(duration)}';
}

String formatMessError(dynamic mess) {
  try {
    return mess.values.first;
  } catch (e) {
    return AppStr.errorInternalServer;
  }
}

String getDefaultFormatCurrency({bool isDot = AppConst.isDot}) {
  return isDot ? '.' : ',';
}

String getDoubleDefaultFormatCurrency({bool isDot = AppConst.isDot}) {
  return isDot ? '..' : ',,';
}
