import 'package:do_an_application/application/app_controller.dart';
import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:do_an_application/utils/show_popup.dart';
import 'package:get/get.dart';

class IndividualController extends BaseGetxController {
  final AppController appController = Get.find<AppController>();

  /// Hiển thị popup xác nhận đăng xuất
  void logout() {
    ShowPopup.showDialogConfirm(
      'Bạn có chắc chắn muốn đăng xuất?',
      confirm: _performLogout,
      actionTitle: 'Đăng xuất',
      exitTitle: 'Hủy',
      title: 'Xác nhận',
    );
  }

  /// Thực hiện đăng xuất
  Future<void> _performLogout() async {
    try {
      showLoading();

      // Xóa token và thông tin user
      await appController.clearToken();

      // Chuyển về màn login
      Get.offAllNamed(AppRoute.routeLogin);
    } catch (e) {
      showSnackBar('Đăng xuất thất bại. Vui lòng thử lại!');
    } finally {
      hideLoading();
    }
  }
}
