import 'package:do_an_application/application/app_controller.dart';
import 'package:do_an_application/base/controllers/base_controller.dart';
import 'package:do_an_application/features/home/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends BaseGetxController {
  late final HomeRepository repository = HomeRepository(this);
  AppController appController = Get.find<AppController>();
}
