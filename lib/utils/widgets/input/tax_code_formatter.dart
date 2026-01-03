import 'package:flutter/services.dart';

/// Mã số thuế cho phép nhập căn cước công dân
///
/// Đối với MST:
/// - Cho phép 10 hoặc 14 ký tự (14 ký tự thì bao gồm cả dấu -)
/// - Khi nhập > 12 ký tự động fill dấu -
///
/// Đối với CCCDan:
/// - Cho phép 12 ký tự ( ko bao gồm dấu -)
///
/// REF: https://jira-sds.softdreams.vn:8080/browse/EIMQLHD-845
class TaxCodeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    // Ký tự '-' chỉ được phép xuất hiện ở vị trí thứ 11
    if (text.length != 11 && text.endsWith('-')) {
      return oldValue;
    }

    // Xóa hết ký tự '-' nếu dưới 11 ký tự
    if (text.length < 11 && text.contains('-')) {
      final newString = text.replaceAll('-', '');
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: newString.length),
      );
    }

    // Khi người dùng nhập tới 13 ký tự, thêm dấu '-' sau ký tự thứ 10
    if (text.length >= 13 && !text.contains('-')) {
      final newString = '${text.substring(0, 10)}-${text.substring(10)}';
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: newString.length),
      );
    }

    // Các trường hợp còn lại: giữ nguyên
    return newValue;
  }
}
