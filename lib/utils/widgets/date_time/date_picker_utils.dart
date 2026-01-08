import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';

import '../../../const/colors.dart';
import '../../../const/dimens.dart';

class DatePickerUtils {
  static Future<DateTime?> showCalendarPicker({
    required String title,
    required String dateFormat,
    DateTime? dateTimeInit,
    DateTime? firstDate,
    DateTime? lastDate,
    EdgeInsetsGeometry? contentPadding,
  }) {
    final minDate = firstDate ?? DateTime(1901);
    final maxDate = lastDate ?? DateTime(2099, 12, 31);
    DateTime? selectedDate = dateTimeInit != null &&
            dateTimeInit.isAfter(minDate) &&
            dateTimeInit.isBefore(maxDate)
        ? dateTimeInit
        : DateTime.now();
    return Get.dialog<DateTime?>(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: AppColors.colorWhite,
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 80),
        titlePadding: const EdgeInsets.only(
          top: AppDimens.defaultPadding,
          right: AppDimens.paddingVerySmall,
          left: AppDimens.defaultPadding,
        ),
        actionsPadding: const EdgeInsets.only(
          right: AppDimens.defaultPadding,
          left: AppDimens.paddingVerySmall,
          bottom: AppDimens.paddingSmall,
        ),
        title: Text(title),
        content: DatePickerWidget(
          looping: true,
          firstDate: minDate,
          lastDate: maxDate,
          initialDate: selectedDate,
          dateFormat: dateFormat,
          onChange: (newDate, _) {
            selectedDate = newDate;
          },
          pickerTheme: DateTimePickerTheme(
            itemTextStyle: TextStyle(color: AppColors.gray1),
            dividerColor: AppColors.gray7,
            dividerSpacing: 0,
            dividerHeight: 1,
            itemHeight: 40,
            pickerHeight: 200,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Hủy',
                style: TextStyle(color: AppColors.gray),
              )),
          TextButton(
            onPressed: () {
              Get.back(result: selectedDate);
            },
            child: Text('Chọn'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
