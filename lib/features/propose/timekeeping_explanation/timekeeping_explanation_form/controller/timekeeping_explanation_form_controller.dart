import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_form/models/create_explanation_request.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_form/repository/timekeeping_explanation_form_repository.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/models/explanation_type.dart';
import 'package:do_an_application/utils/date_utils.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimekeepingExplanationFormController extends BaseGetxController {
  late final TimekeepingExplanationFormRepository _repository;

  final timekeepingDateCtrl = TextEditingController();
  final reasonCtrl = TextEditingController();
  final explanationTypeSelected = ''.obs;

  // Map từ display name sang ExplanationType enum
  final Map<String, ExplanationType> explanationTypeMap = {
    'Đi trễ': ExplanationType.lateArrival,
    'Về sớm': ExplanationType.earlyLeave,
    'Lỗi chấm công': ExplanationType.absent,
  };

  @override
  void onInit() {
    super.onInit();
    _repository = TimekeepingExplanationFormRepository(this);
  }

  Future<void> submitExplanation() async {
    // Validate
    if (timekeepingDateCtrl.text.isEmpty) {
      showSnackBar('Vui lòng chọn ngày chấm công');
      return;
    }

    if (explanationTypeSelected.value.isEmpty) {
      showSnackBar('Vui lòng chọn loại giải trình');
      return;
    }

    if (reasonCtrl.text.isEmpty) {
      showSnackBar('Vui lòng nhập lý do');
      return;
    }

    try {
      showLoading();

      final workDate =
          convertStringToDate(timekeepingDateCtrl.text, PATTERN_1);
      final explanationType = explanationTypeMap[explanationTypeSelected.value] ??
          ExplanationType.lateArrival;

      final request = CreateExplanationRequest(
        workDate: workDate,
        explanationType: explanationType,
        reason: reasonCtrl.text.trim(),
        attachmentUrl: null,
      );

      final response = await _repository.createExplanation(request);

      if (response.isSuccess) {
        showSnackBar('Tạo đơn giải trình thành công');
        Get.back(result: true); // Trả về true để refresh danh sách
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error creating explanation: $e');
      showSnackBar('Có lỗi xảy ra khi tạo đơn giải trình');
    } finally {
      hideLoading();
    }
  }

  @override
  void onClose() {
    timekeepingDateCtrl.dispose();
    reasonCtrl.dispose();
    super.onClose();
  }
}
