import 'package:do_an_application/application/app_controller.dart';
import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/features/login/models/roles_enum.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/models/attendance_explantation_item.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/repository/attendance_explantation_repository.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:get/get.dart';

class AttendanceExplanationController extends BaseGetxController {
  late final AttendanceExplantationRepository _repository;
  AppController appController = Get.find<AppController>();
  final role = UserRole.employee.obs;

  final RxList<AttendanceExplanationItem> explanations =
      <AttendanceExplanationItem>[].obs;
  final RxString selectedStatus = 'Tất cả'.obs;

  @override
  void onInit() {
    super.onInit();
    _repository = AttendanceExplantationRepository(this);
    role.value = appController.currentUserRole.value;
    fetchMyExplanations();
  }

  Future<void> fetchMyExplanations() async {
    try {
      showLoading();
      final response = await _repository.getMyRequests();

      if (response.success == true) {
        final data = response.data;
        // Sắp xếp theo ngày tạo, mới nhất lên đầu
        data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        explanations.value = data;
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error fetching explanations: $e');
    } finally {
      hideLoading();
    }
  }

  List<AttendanceExplanationItem> get filteredExplanations {
    if (selectedStatus.value == 'Tất cả') {
      return explanations;
    }

    return explanations.where((explanation) {
      switch (selectedStatus.value) {
        case 'Chờ quản lý duyệt':
          return explanation.status.isPendingManager;
        case 'Chờ nhân sự duyệt':
          return explanation.status.isPendingHR;
        case 'Đã duyệt':
          return explanation.status.isApproved;
        case 'Từ chối':
          return explanation.status.isRejected;
        case 'Đã hủy':
          return explanation.status.isCancelled;
        default:
          return true;
      }
    }).toList();
  }

  void updateStatusFilter(String status) {
    selectedStatus.value = status;
  }
}
