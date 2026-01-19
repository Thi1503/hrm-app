import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_form/models/register_leave_request.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_form/repository/register_leave_form_repository.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/models/leave_type.dart';
import 'package:do_an_application/utils/date_utils.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterLeaveFormController extends BaseGetxController {
  late final RegisterLeaveFormRepository _repository;

  final fromDateCtrl = TextEditingController();
  final toDateCtrl = TextEditingController();
  final reasonCtrl = TextEditingController();
  final countDayLeaveCtrl = TextEditingController();
  final leaveTypeSelected = ''.obs;
  final totalDays = '0'.obs;

  // Map từ display name sang LeaveType enum
  final Map<String, LeaveType> leaveTypeMap = {
    'Nghỉ phép năm': LeaveType.annual,
    'Nghỉ không lương': LeaveType.unpaid,
    'Nghỉ ốm': LeaveType.sick,
    'Khác': LeaveType.other,
  };

  @override
  void onInit() {
    super.onInit();
    _repository = RegisterLeaveFormRepository(this);

    // Lắng nghe thay đổi của fromDate và toDate để tính số ngày
    fromDateCtrl.addListener(_calculateTotalDays);
    toDateCtrl.addListener(_calculateTotalDays);
  }

  void _calculateTotalDays() {
    final fromDateStr = fromDateCtrl.text;
    final toDateStr = toDateCtrl.text;

    if (fromDateStr.isEmpty || toDateStr.isEmpty) {
      totalDays.value = '0';
      return;
    }

    final fromDate = convertStringToDateSafe(fromDateStr, PATTERN_1);
    final toDate = convertStringToDateSafe(toDateStr, PATTERN_1);

    if (fromDate == null || toDate == null) {
      totalDays.value = '0';
      return;
    }

    if (toDate.isBefore(fromDate)) {
      totalDays.value = '0';
      return;
    }

    final days = toDate.difference(fromDate).inDays + 1;
    totalDays.value = days.toString();
  }

  Future<void> submitLeaveRequest() async {
    // Validate
    if (fromDateCtrl.text.isEmpty) {
      showSnackBar('Vui lòng chọn từ ngày');
      return;
    }

    if (toDateCtrl.text.isEmpty) {
      showSnackBar('Vui lòng chọn đến ngày');
      return;
    }

    if (leaveTypeSelected.value.isEmpty) {
      showSnackBar('Vui lòng chọn loại nghỉ');
      return;
    }

    if (reasonCtrl.text.isEmpty) {
      showSnackBar('Vui lòng nhập lý do');
      return;
    }

    try {
      showLoading();

      final fromDate = convertStringToDate(fromDateCtrl.text, PATTERN_1);
      final toDate = convertStringToDate(toDateCtrl.text, PATTERN_1);
      final leaveType =
          leaveTypeMap[leaveTypeSelected.value] ?? LeaveType.other;

      final request = RegisterLeaveRequest(
        leaveType: leaveType,
        fromDate: fromDate,
        toDate: toDate,
        reason: reasonCtrl.text.trim(),
        attachmentUrl: null,
      );

      final response = await _repository.createLeaveRequest(request);

      if (response.isSuccess) {
        showSnackBar('Tạo đơn xin nghỉ thành công');
        Get.back(result: true); // Trả về true để refresh danh sách
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error creating leave request: $e');
      showSnackBar('Có lỗi xảy ra khi tạo đơn xin nghỉ');
    } finally {
      hideLoading();
    }
  }

  @override
  void onClose() {
    fromDateCtrl.dispose();
    toDateCtrl.dispose();
    reasonCtrl.dispose();
    countDayLeaveCtrl.dispose();
    super.onClose();
  }
}
