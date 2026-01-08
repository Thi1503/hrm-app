import 'package:flutter/services.dart';

class TimeInputFormatter extends TextInputFormatter {
  // HHmm => tối đa 4 ký tự số
  final int maxLength = 4;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final selectionIndex = newValue.selection.baseOffset;
    // Chỉ giữ lại các chữ số
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Giới hạn độ dài 4 ký tự
    if (digitsOnly.length > maxLength) {
      digitsOnly = digitsOnly.substring(0, maxLength);
    }

    final buffer = StringBuffer();
    int offset = selectionIndex;

    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);

      // Chèn ':' sau vị trí thứ 2 (tức là sau chỉ số i = 1)
      if (i == 1 && i != digitsOnly.length - 1) {
        buffer.write(':');

        // Điều chỉnh con trỏ nếu đang đứng sau vị trí chèn ':'
        if (selectionIndex > i + 1) {
          offset++;
        }
      }
    }

    // Đảm bảo con trỏ không vượt quá độ dài chuỗi mới
    final finalText = buffer.toString();
    offset = offset.clamp(0, finalText.length);

    return TextEditingValue(
      text: finalText,
      selection: TextSelection.collapsed(offset: offset),
    );
  }
}
