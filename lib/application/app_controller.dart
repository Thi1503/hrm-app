import 'dart:typed_data';

import 'package:do_an_application/const/const.dart';
import 'package:do_an_application/const/string_value.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:upgrader/upgrader.dart';

import '../base/base.dart';

late Box HIVE_APP;

GetStorage APP_DATA = GetStorage();

final Rx<Uint8List> imageScreenShot = Rx<Uint8List>(Uint8List(0));

late Upgrader upgrader;

class AppController extends GetxController {
  final RxBool isShowSupportCus = true.obs;
  final RxBool isSys78 = true.obs;
  final RxBool isBusinessHousehold = false.obs;
  final RxBool isFaceID = false.obs;

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    await Future.delayed(const Duration(seconds: 1));
    await _initHive();
    _initLocalData();
    _initBaseService();

    /// Điều hướng SAU KHI UI SPLASH ĐÃ SẴN SÀNG
    Get.offAllNamed(AppRoute.routeLogin);
  }

  Future<void> _initHive() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    upgrader = Upgrader(
      messages: UpgraderMessages(code: Get.locale?.languageCode),
      countryCode: Get.locale?.countryCode,
    );

    Hive.init(appDocumentDirectory.path);
    HIVE_APP = await Hive.openBox(AppStr.appName);
  }

  void _initLocalData() {
    isFaceID.value = APP_DATA.read(AppConst.keyFingerprint) ?? false;
  }

  void _initBaseService() {
    Get.put(BaseRequest(), permanent: true);
    Get.put(BaseGetxController(), permanent: true);
  }

  void changeBusinessType() {
    isBusinessHousehold.toggle();
  }
}
