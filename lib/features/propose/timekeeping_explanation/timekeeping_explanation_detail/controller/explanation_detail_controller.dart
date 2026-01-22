import 'package:do_an_application/base/controllers/base_controller.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_detail/models/explanation_detail.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_detail/models/explanation_detail_argument.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_detail/repository/explanation_detail_repository.dart';
import 'package:do_an_application/features/propose/models/reject_request.dart';
import 'package:do_an_application/features/propose/models/approval_request.dart';
import 'package:do_an_application/features/propose/enums/request_type.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:do_an_application/utils/show_popup.dart';
import 'package:get/get.dart';

class ExplanationDetailController extends BaseGetxController {
  late final ExplanationDetailRepository _repository;
  late final ExplanationDetailArgument argument;

  final Rxn<ExplanationDetail> explanationDetail = Rxn<ExplanationDetail>();

  @override
  void onInit() {
    super.onInit();
    _repository = ExplanationDetailRepository(this);
    argument = Get.arguments as ExplanationDetailArgument;
    fetchExplanationDetail();
  }

  bool get isShowBottomActions =>
      argument.isFromManagerListPage || argument.isFromHrListPage;

  Future<void> fetchExplanationDetail() async {
    try {
      showLoading();
      final response =
          await _repository.getExplanationDetail(argument.requestId);

      if (response.isSuccess && response.data != null) {
        final detail = ExplanationDetail.fromJson(response.data);
        explanationDetail.value = detail;
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error fetching explanation detail: $e');
      showSnackBar('Có lỗi xảy ra khi tải thông tin chi tiết');
    } finally {
      hideLoading();
    }
  }

  Future<void> rejectExplanation(String reason) async {
    try {
      showLoading();
      final rejectRequest = RejectRequest(
        requestId: argument.requestId,
        requestType: RequestType.explanation,
        comment: reason,
      );

      final response = await _repository.rejectExplanation(rejectRequest);

      if (response.isSuccess) {
        showSnackBar('Từ chối đơn giải trình thành công');
        Get.back(result: true);
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error rejecting explanation: $e');
      showSnackBar('Có lỗi xảy ra khi từ chối đơn giải trình');
    } finally {
      hideLoading();
    }
  }

  Future<void> approveExplanation() async {
    try {
      showLoading();
      final approvalRequest = ApprovalRequest(
        requestId: argument.requestId,
        requestType: RequestType.explanation,
      );

      final response = await _repository.approveExplanation(
        approvalRequest: approvalRequest,
        isHr: argument.isFromHrListPage,
      );

      if (response.isSuccess) {
        showSnackBar('Phê duyệt đơn giải trình thành công');
        Get.back(result: true);
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error approving explanation: $e');
      showSnackBar('Có lỗi xảy ra khi phê duyệt đơn giải trình');
    } finally {
      hideLoading();
    }
  }

  void showApproveDialog() {
    ShowPopup.showDialogConfirm(
      'Bạn có chắc chắn muốn phê duyệt đơn giải trình này không?',
      confirm: approveExplanation,
      actionTitle: 'Phê duyệt',
      exitTitle: 'Hủy',
      title: 'Xác nhận phê duyệt',
    );
  }
}
