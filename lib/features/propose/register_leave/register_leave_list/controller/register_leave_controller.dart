import 'package:do_an_application/application/app_controller.dart';
import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/features/login/models/roles_enum.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/models/leave_request_item.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/models/leave_request_manager_item.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/repository/register_leave_list_repository.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:get/get.dart';

class RegisterLeaveController extends BaseGetxController {
  late final RegisterLeaveListRepository _repository;
  AppController appController = Get.find<AppController>();
  final role = UserRole.employee.obs;

  final RxList<LeaveRequestItem> leaveRequests = <LeaveRequestItem>[].obs;
  final RxList<LeaveRequestManagerItem> managerLeaveRequests =
      <LeaveRequestManagerItem>[].obs;
  final RxString selectedStatus = 'Tất cả'.obs;

  @override
  void onInit() {
    super.onInit();
    _repository = RegisterLeaveListRepository(this);
    role.value = appController.currentUserRole.value;
    fetchLeaveRequests();
    fetchManagerLeaveRequests();
  }

  Future<void> fetchLeaveRequests() async {
    try {
      showLoading();
      final response = await _repository.getMyRequests();

      if (response.success == true) {
        final data = response.data;
        // Sắp xếp theo ngày tạo, mới nhất lên đầu
        data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        leaveRequests.value = data;
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error fetching leave requests: $e');
    } finally {
      hideLoading();
    }
  }

  Future<void> fetchManagerLeaveRequests() async {
    try {
      showLoading();
      final response = await _repository.getManagerRequests();

      if (response.success == true) {
        final data = response.data;
        // Sắp xếp theo ngày tạo, mới nhất lên đầu
        managerLeaveRequests.value = data;
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error fetching manager leave requests: $e');
    } finally {
      hideLoading();
    }
  }

  List<LeaveRequestItem> get filteredRequests {
    if (selectedStatus.value == 'Tất cả') {
      return leaveRequests;
    }

    return leaveRequests.where((request) {
      switch (selectedStatus.value) {
        case 'Chờ quản lý duyệt':
          return request.status.isPendingManager;
        case 'Chờ nhân sự duyệt':
          return request.status.isPendingHR;
        case 'Đã duyệt':
          return request.status.isApproved;
        case 'Từ chối':
          return request.status.isRejected;
        case 'Đã hủy':
          return request.status.isCancelled;
        default:
          return true;
      }
    }).toList();
  }

  List<LeaveRequestManagerItem> get filteredManagerRequests {
    if (selectedStatus.value == 'Tất cả') {
      return managerLeaveRequests;
    }

    return managerLeaveRequests.where((request) {
      switch (selectedStatus.value) {
        case 'Chờ quản lý duyệt':
          return request.status.isPendingManager;
        case 'Chờ nhân sự duyệt':
          return request.status.isPendingHR;
        case 'Đã duyệt':
          return request.status.isApproved;
        case 'Từ chối':
          return request.status.isRejected;
        case 'Đã hủy':
          return request.status.isCancelled;
        default:
          return true;
      }
    }).toList();
  }

  void updateStatusFilter(String status) {
    selectedStatus.value = status;
  }
}
