import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/features/propose/overtime/overtime_form/models/create_ot_request.dart';
import 'package:do_an_application/features/propose/overtime/overtime_form/repository/overtime_form_repository.dart';
import 'package:do_an_application/utils/date_utils.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OvertimeFormController extends BaseGetxController {
  late final OvertimeFormRepository _repository;

  final otDateCtrl = TextEditingController();
  final startTimeCtrl = TextEditingController();
  final endTimeCtrl = TextEditingController();
  final reasonCtrl = TextEditingController();

  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  @override
  void onInit() {
    super.onInit();
    _repository = OvertimeFormRepository(this);
  }

  Future<void> selectOtDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: convertStringToDateSafe(otDateCtrl.text, PATTERN_1) ??
          DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      otDateCtrl.text = convertDateToStringSafe(picked, PATTERN_1) ?? '';
    }
  }

  Future<void> selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedStartTime ?? const TimeOfDay(hour: 8, minute: 0),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedStartTime = picked;
      startTimeCtrl.text = _formatTime(picked);
    }
  }

  Future<void> selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedEndTime ?? const TimeOfDay(hour: 17, minute: 0),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedEndTime = picked;
      endTimeCtrl.text = _formatTime(picked);
    }
  }

  String _formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  Future<void> submitOtRequest() async {
    // Validate
    if (otDateCtrl.text.isEmpty) {
      showSnackBar('Vui lòng chọn ngày OT');
      return;
    }

    if (startTimeCtrl.text.isEmpty) {
      showSnackBar('Vui lòng chọn giờ bắt đầu');
      return;
    }

    if (endTimeCtrl.text.isEmpty) {
      showSnackBar('Vui lòng chọn giờ kết thúc');
      return;
    }

    if (reasonCtrl.text.isEmpty) {
      showSnackBar('Vui lòng nhập lý do');
      return;
    }

    if (selectedStartTime == null || selectedEndTime == null) {
      showSnackBar('Vui lòng chọn thời gian hợp lệ');
      return;
    }

    // Validate start time < end time
    final startMinutes = selectedStartTime!.hour * 60 + selectedStartTime!.minute;
    final endMinutes = selectedEndTime!.hour * 60 + selectedEndTime!.minute;
    if (startMinutes >= endMinutes) {
      showSnackBar('Giờ bắt đầu phải nhỏ hơn giờ kết thúc');
      return;
    }

    try {
      showLoading();

      final otDate = convertStringToDate(otDateCtrl.text, PATTERN_1);

      final request = CreateOtRequest(
        otDate: otDate,
        startTime: OtTime(
          hour: selectedStartTime!.hour,
          minute: selectedStartTime!.minute,
        ),
        endTime: OtTime(
          hour: selectedEndTime!.hour,
          minute: selectedEndTime!.minute,
        ),
        reason: reasonCtrl.text.trim(),
      );

      final response = await _repository.createOtRequest(request);

      if (response.isSuccess) {
        showSnackBar('Tạo đơn OT thành công');
        Get.back(result: true); // Trả về true để refresh danh sách
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error creating OT request: $e');
      showSnackBar('Có lỗi xảy ra khi tạo đơn OT');
    } finally {
      hideLoading();
    }
  }

  @override
  void onClose() {
    otDateCtrl.dispose();
    startTimeCtrl.dispose();
    endTimeCtrl.dispose();
    reasonCtrl.dispose();
    super.onClose();
  }
}
