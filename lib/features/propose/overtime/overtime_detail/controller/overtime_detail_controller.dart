import 'package:do_an_application/base/controllers/base_controller.dart';
import 'package:do_an_application/features/propose/overtime/overtime_detail/models/overtime_detail_argument.dart';
import 'package:do_an_application/features/propose/overtime/overtime_detail/models/ot_request_detail.dart';
import 'package:do_an_application/features/propose/overtime/overtime_detail/repository/overtime_detail_repository.dart';
import 'package:do_an_application/features/propose/models/reject_request.dart';
import 'package:do_an_application/features/propose/models/approval_request.dart';
import 'package:do_an_application/features/propose/enums/request_type.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:do_an_application/utils/show_popup.dart';
import 'package:get/get.dart';

class OvertimeDetailController extends BaseGetxController {
  late final OvertimeDetailRepository _repository;
  late final OvertimeDetailArgument argument;

  final Rxn<OtRequestDetail> otDetail = Rxn<OtRequestDetail>();

  @override
  void onInit() {
    super.onInit();
    _repository = OvertimeDetailRepository(this);
    argument = Get.arguments as OvertimeDetailArgument;
    fetchOtDetail();
  }

  bool get isShowBottomActions =>
      argument.isFromManagerListPage || argument.isFromHrListPage;

  Future<void> fetchOtDetail() async {
    try {
      showLoading();
      final response = await _repository.getOtRequestDetail(argument.otId);

      if (response.isSuccess && response.data != null) {
        final detail = OtRequestDetail.fromJson(response.data);
        otDetail.value = detail;
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error fetching OT detail: $e');
      showSnackBar('Có lỗi xảy ra khi tải thông tin chi tiết');
    } finally {
      hideLoading();
    }
  }

  Future<void> rejectOtRequest(String reason) async {
    try {
      showLoading();
      final rejectRequest = RejectRequest(
        requestId: argument.otId,
        requestType: RequestType.ot,
        comment: reason,
      );

      final response = await _repository.rejectOtRequest(rejectRequest);

      if (response.isSuccess) {
        showSnackBar('Từ chối đơn OT thành công');
        Get.back(result: true);
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error rejecting OT request: $e');
      showSnackBar('Có lỗi xảy ra khi từ chối đơn OT');
    } finally {
      hideLoading();
    }
  }

  Future<void> approveOtRequest() async {
    try {
      showLoading();
      final approvalRequest = ApprovalRequest(
        requestId: argument.otId,
        requestType: RequestType.ot,
      );

      final response = await _repository.approveOtRequest(
        approvalRequest: approvalRequest,
        isHr: argument.isFromHrListPage,
      );

      if (response.isSuccess) {
        showSnackBar('Phê duyệt đơn OT thành công');
        Get.back(result: true);
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error approving OT request: $e');
      showSnackBar('Có lỗi xảy ra khi phê duyệt đơn OT');
    } finally {
      hideLoading();
    }
  }

  void showApproveDialog() {
    ShowPopup.showDialogConfirm(
      'Bạn có chắc chắn muốn phê duyệt đơn OT này không?',
      confirm: approveOtRequest,
      actionTitle: 'Phê duyệt',
      exitTitle: 'Hủy',
      title: 'Xác nhận phê duyệt',
    );
  }
}
