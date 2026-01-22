import 'package:do_an_application/application/app_controller.dart';
import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/features/login/models/roles_enum.dart';
import 'package:do_an_application/features/propose/overtime/overtime_list/models/ot_request_hr_item.dart';
import 'package:do_an_application/features/propose/overtime/overtime_list/models/ot_request_item.dart';
import 'package:do_an_application/features/propose/overtime/overtime_list/models/ot_request_manager_item.dart';
import 'package:do_an_application/features/propose/overtime/overtime_list/repository/overtime_list_repository.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:get/get.dart';

class OvertimeListController extends BaseGetxController {
  late final OvertimeListRepository _repository;
  AppController appController = Get.find<AppController>();
  final role = UserRole.employee.obs;

  final RxList<OtRequestItem> otRequests = <OtRequestItem>[].obs;
  final RxList<OtRequestManagerItem> managerOtRequests =
      <OtRequestManagerItem>[].obs;
  final RxList<OtRequestHrItem> hrOtRequests = <OtRequestHrItem>[].obs;
  final RxString selectedStatus = 'Tất cả'.obs;

  @override
  void onInit() {
    super.onInit();
    _repository = OvertimeListRepository(this);
    role.value = appController.currentUserRole.value;
    fetchOtRequests();
    fetchManagerOtRequests();
    if (role.value == UserRole.hr || role.value == UserRole.admin) {
      fetchHrRequests();
    }
  }

  bool get isHRorAdmin =>
      appController.currentUserRole.value == UserRole.hr ||
      appController.currentUserRole.value == UserRole.admin;

  Future<void> fetchOtRequests() async {
    try {
      showLoading();
      final response = await _repository.getMyRequests();

      if (response.success == true) {
        final data = response.data;
        // Sắp xếp theo ngày tạo, mới nhất lên đầu
        data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        otRequests.value = data;
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error fetching OT requests: $e');
    } finally {
      hideLoading();
    }
  }

  Future<void> fetchManagerOtRequests() async {
    try {
      showLoading();
      final response = await _repository.getManagerRequests();

      if (response.success == true) {
        final data = response.data;
        managerOtRequests.value = data;
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error fetching manager OT requests: $e');
    } finally {
      hideLoading();
    }
  }

  Future<void> fetchHrRequests() async {
    try {
      showLoading();
      final response = await _repository.getHrRequests();

      if (response.success == true) {
        final data = response.data;
        hrOtRequests.value = data;
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error fetching HR OT requests: $e');
    } finally {
      hideLoading();
    }
  }

  List<OtRequestItem> get filteredRequests {
    if (selectedStatus.value == 'Tất cả') {
      return otRequests;
    }
    return otRequests
        .where((request) => request.status.displayName == selectedStatus.value)
        .toList();
  }

  List<OtRequestManagerItem> get filteredManagerRequests {
    if (selectedStatus.value == 'Tất cả') {
      return managerOtRequests;
    }
    return managerOtRequests
        .where((request) => request.status.displayName == selectedStatus.value)
        .toList();
  }

  List<OtRequestHrItem> get filteredHrRequests {
    if (selectedStatus.value == 'Tất cả') {
      return hrOtRequests;
    }
    return hrOtRequests
        .where((request) => request.status.displayName == selectedStatus.value)
        .toList();
  }

  void setStatusFilter(String status) {
    selectedStatus.value = status;
  }

  Future<void> refreshData() async {
    await fetchOtRequests();
    await fetchManagerOtRequests();
    if (isHRorAdmin) {
      await fetchHrRequests();
    }
  }
}
