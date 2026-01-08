import 'package:do_an_application/utils/widgets/input/tax_code_formatter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

import '../../../const/all_const.dart';
import '../../../const/enum/input_formatter_enum.dart';
import '../../formatter/date_full_input_formatter.dart';
import '../../utils.dart';

mixin FormatterEnum {
  List<TextInputFormatter> getFormatters(InputTextModel inputTextFormModel) {
    switch (inputTextFormModel.inputFormatters) {
      case InputFormatterEnum.digitsOnly:
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(
              inputTextFormModel.maxLengthInputForm),
        ];
      case InputFormatterEnum.taxCode:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
          TaxCodeFormatter(),
          LengthLimitingTextInputFormatter(14),
          // MaskedInputFormatter('##########-###')
        ];
      case InputFormatterEnum.textOnly:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9-_\.]')),
        ];
      case InputFormatterEnum.currency:
        return [
          NumericTextFormatter(),
        ];

      case InputFormatterEnum.negativeNumber:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
        ];

      case InputFormatterEnum.decimalNumber:
        return [
          CommaFormatter(),
          FilteringTextInputFormatter.allow(RegExp(
              '[0-9${getDefaultFormatCurrency(isDot: !AppConst.isDot)}]')),
        ];

      case InputFormatterEnum.identity:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
          MaskedInputFormatter('############')
        ];
      case InputFormatterEnum.phoneNumber:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
          MaskedInputFormatter('##############')
        ];
      case InputFormatterEnum.password:
        return [
          FilteringTextInputFormatter.deny(RegExp(r'( )')),
        ];
      case InputFormatterEnum.taxAuthorityCode:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9-_\.]')),
          LengthLimitingTextInputFormatter(
              inputTextFormModel.maxLengthInputForm),
        ];
      case InputFormatterEnum.dateFullBirthDay:
        return [
          FilteringTextInputFormatter.digitsOnly,
          DateInputFormatter(),
        ];
      default:
        return [
          LengthLimitingTextFieldFormatterFixed(
              inputTextFormModel.maxLengthInputForm)
        ];
    }
  }
}
