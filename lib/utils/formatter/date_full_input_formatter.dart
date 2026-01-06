import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  final int maxLength = 8; // ddMMyyyy

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final selectionIndex = newValue.selection.baseOffset;
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.length > maxLength) {
      digitsOnly = digitsOnly.substring(0, maxLength);
    }

    final buffer = StringBuffer();
    int offset = selectionIndex;

    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);

      // Chèn '/' sau vị trí 2 và 4 => tức sau ký tự 1 và 3 (0-based)
      if ((i == 1 || i == 3) && i != digitsOnly.length - 1) {
        buffer.write('/');

        // Nếu con trỏ đang sau vị trí chèn '/', thì cần dời offset
        if (selectionIndex > i) {
          offset++;
        }
      }
    }

    // Đảm bảo con trỏ không vượt quá độ dài chuỗi
    offset = offset.clamp(0, buffer.length);

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: offset),
    );
  }
}
