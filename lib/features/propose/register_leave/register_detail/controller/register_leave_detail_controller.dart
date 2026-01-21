import 'package:do_an_application/base/controllers/base_controller.dart';
import 'package:do_an_application/features/propose/register_leave/register_detail/models/leave_request_detail.dart';
import 'package:do_an_application/features/propose/register_leave/register_detail/models/register_leave_detail_argument.dart';
import 'package:do_an_application/features/propose/register_leave/register_detail/repository/register_leave_detail_repository.dart';
import 'package:do_an_application/features/propose/models/reject_request.dart';
import 'package:do_an_application/features/propose/models/approval_request.dart';
import 'package:do_an_application/features/propose/enums/request_type.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:do_an_application/utils/show_popup.dart';
import 'package:get/get.dart';

class RegisterLeaveDetailController extends BaseGetxController {
  late final RegisterLeaveDetailRepository _repository;
  late final RegisterLeaveDetailArgument argument;

  final Rxn<LeaveRequestDetail> leaveDetail = Rxn<LeaveRequestDetail>();

  @override
  void onInit() {
    super.onInit();
    _repository = RegisterLeaveDetailRepository(this);
    argument = Get.arguments as RegisterLeaveDetailArgument;
    fetchLeaveDetail();
  }

  bool get isShowBottomActions =>
      argument.isFromManagerListPage || argument.isFromHrListPage;

  Future<void> fetchLeaveDetail() async {
    try {
      showLoading();
      final response =
          await _repository.getLeaveRequestDetail(argument.registerId);

      if (response.isSuccess && response.data != null) {
        final detail = LeaveRequestDetail.fromJson(response.data);
        leaveDetail.value = detail;
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error fetching leave detail: $e');
      showSnackBar('Có lỗi xảy ra khi tải thông tin chi tiết');
    } finally {
      hideLoading();
    }
  }

  Future<void> rejectLeaveRequest(String reason) async {
    try {
      showLoading();
      final rejectRequest = RejectRequest(
        requestId: argument.registerId,
        requestType: RequestType.leave,
        comment: reason,
      );

      final response = await _repository.rejectLeaveRequest(rejectRequest);

      if (response.isSuccess) {
        showSnackBar('Từ chối đơn nghỉ phép thành công');
        Get.back(result: true);
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error rejecting leave request: $e');
      showSnackBar('Có lỗi xảy ra khi từ chối đơn nghỉ phép');
    } finally {
      hideLoading();
    }
  }

  Future<void> approveLeaveRequest() async {
    try {
      showLoading();
      final approvalRequest = ApprovalRequest(
        requestId: argument.registerId,
        requestType: RequestType.leave,
      );

      final response = await _repository.approveLeaveRequest(
        approvalRequest: approvalRequest,
        isHr: argument.isFromHrListPage,
      );

      if (response.isSuccess) {
        showSnackBar('Phê duyệt đơn nghỉ phép thành công');
        Get.back(result: true);
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error approving leave request: $e');
      showSnackBar('Có lỗi xảy ra khi phê duyệt đơn nghỉ phép');
    } finally {
      hideLoading();
    }
  }

  void showApproveDialog() {
    ShowPopup.showDialogConfirm(
      'Bạn có chắc chắn muốn phê duyệt đơn nghỉ phép này không?',
      confirm: approveLeaveRequest,
      actionTitle: 'Phê duyệt',
      exitTitle: 'Hủy',
      title: 'Xác nhận phê duyệt',
    );
  }
}
