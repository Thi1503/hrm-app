import 'package:do_an_application/base/controllers/base_controller.dart';
import 'package:do_an_application/features/propose/register_leave/register_detail/models/leave_request_detail.dart';
import 'package:do_an_application/features/propose/register_leave/register_detail/models/register_leave_detail_argument.dart';
import 'package:do_an_application/features/propose/register_leave/register_detail/repository/register_leave_detail_repository.dart';
import 'package:do_an_application/utils/logger.dart';
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
}
