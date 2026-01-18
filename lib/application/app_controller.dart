import 'dart:typed_data';

import 'package:do_an_application/const/const.dart';
import 'package:do_an_application/const/string_value.dart';
import 'package:do_an_application/features/login/models/roles_enum.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:do_an_application/utils/jwt_helper.dart';
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

  // Token và thông tin user
  final Rxn<String> accessToken = Rxn<String>();
  final Rx<UserRole> currentUserRole = UserRole.employee.obs;
  final Rxn<String> userId = Rxn<String>();
  final Rxn<String> username = Rxn<String>();
  final Rxn<String> employeeName = Rxn<String>();
  final Rxn<int> employeeId = Rxn<int>();
  final RxList<String> permissions = <String>[].obs;

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

    /// Kiểm tra token và điều hướng
    if (isTokenValid()) {
      // Token còn hạn, vào màn hình chính
      Get.offAllNamed(AppRoute.routeMain);
    } else {
      // Token hết hạn hoặc không có, vào màn hình login
      Get.offAllNamed(AppRoute.routeLogin);
    }
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
    loadSavedToken();
  }

  void _initBaseService() {
    Get.put(BaseRequest(), permanent: true);
    Get.put(BaseGetxController(), permanent: true);
  }

  void changeBusinessType() {
    isBusinessHousehold.toggle();
  }

  /// Lưu token và parse thông tin từ JWT
  Future<void> saveToken(String token) async {
    accessToken.value = token;
    HIVE_APP.put(AppConst.keyToken, token);

    // Parse thông tin từ token
    final roleString = JwtHelper.getFirstRole(token);
    currentUserRole.value =
        UserRole.fromString(roleString) ?? UserRole.employee;

    userId.value = JwtHelper.getUserId(token);
    username.value = JwtHelper.getUsername(token);
    employeeName.value = JwtHelper.getEmployeeName(token);
    employeeId.value = JwtHelper.getEmployeeId(token);
    permissions.value = JwtHelper.getPermissions(token);

    // Lưu role vào HIVE để sử dụng offline
    HIVE_APP.put(AppConst.keyRole, currentUserRole.value.value);
  }

  /// Load token từ HIVE khi khởi động app
  void loadSavedToken() {
    final savedToken = HIVE_APP.get(AppConst.keyToken) as String?;
    if (savedToken != null && !JwtHelper.isTokenExpired(savedToken)) {
      accessToken.value = savedToken;

      // Parse lại thông tin từ token
      final roleString = JwtHelper.getFirstRole(savedToken);
      currentUserRole.value =
          UserRole.fromString(roleString) ?? UserRole.employee;

      userId.value = JwtHelper.getUserId(savedToken);
      username.value = JwtHelper.getUsername(savedToken);
      employeeName.value = JwtHelper.getEmployeeName(savedToken);
      employeeId.value = JwtHelper.getEmployeeId(savedToken);
      permissions.value = JwtHelper.getPermissions(savedToken);
    }
  }

  /// Kiểm tra xem token có hợp lệ và còn hạn không
  bool isTokenValid() {
    final savedToken = accessToken.value;
    return savedToken != null &&
        savedToken.isNotEmpty &&
        !JwtHelper.isTokenExpired(savedToken);
  }

  /// Xóa token khi logout
  Future<void> clearToken() async {
    accessToken.value = null;
    currentUserRole.value = UserRole.employee;
    userId.value = null;
    username.value = null;
    employeeName.value = null;
    employeeId.value = null;
    permissions.clear();

    await HIVE_APP.delete(AppConst.keyToken);
    await HIVE_APP.delete(AppConst.keyRole);
  }

  /// Kiểm tra quyền
  bool hasPermission(String permission) {
    return permissions.contains(permission);
  }

  /// Kiểm tra role
  bool hasRole(UserRole role) {
    return currentUserRole.value == role;
  }
}
