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

  @override
  void onInit() {
    super.onInit();
    _repository = OvertimeFormRepository(this);
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

    // Parse time from string HH:mm
    final startParts = startTimeCtrl.text.split(':');
    final endParts = endTimeCtrl.text.split(':');

    if (startParts.length < 2 || endParts.length < 2) {
      showSnackBar('Định dạng thời gian không hợp lệ');
      return;
    }

    final startHour = int.tryParse(startParts[0]) ?? 0;
    final startMinute = int.tryParse(startParts[1]) ?? 0;
    final endHour = int.tryParse(endParts[0]) ?? 0;
    final endMinute = int.tryParse(endParts[1]) ?? 0;

    // Validate start time < end time
    final startMinutes = startHour * 60 + startMinute;
    final endMinutes = endHour * 60 + endMinute;
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
          hour: startHour,
          minute: startMinute,
        ),
        endTime: OtTime(
          hour: endHour,
          minute: endMinute,
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
