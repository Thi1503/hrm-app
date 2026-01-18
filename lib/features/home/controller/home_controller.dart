import 'package:do_an_application/application/app_controller.dart';
import 'package:do_an_application/base/controllers/base_controller.dart';
import 'package:do_an_application/features/profile/models/my_info_response.dart';
import 'package:do_an_application/features/home/repository/home_repository.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:get/get.dart';

class HomeController extends BaseGetxController {
  late final HomeRepository repository = HomeRepository(this);
  AppController appController = Get.find<AppController>();

  @override
  void onInit() {
    fetchMyInfo();

    super.onInit();
  }

  Future<void> fetchMyInfo() async {
    try {
      showLoading();

      final response = await repository.getMyInfo();

      if (response.isSuccess && response.data != null) {
        appController.myInfoResponse.value =
            MyInfoResponse.fromJson(response.data);
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoading();
    }
  }
}
