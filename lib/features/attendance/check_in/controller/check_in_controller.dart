import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/features/attendance/models/check_in_request.dart';
import 'package:do_an_application/features/attendance/services/location_service.dart';
import 'package:do_an_application/features/home/repository/home_repository.dart';
import 'package:do_an_application/utils/logger.dart';
import 'package:location/location.dart' as loc;
import 'package:get/get.dart';

class CheckInController extends BaseGetxController {
  late final HomeRepository _repository;

  final Rxn<loc.LocationData> currentPosition = Rxn<loc.LocationData>();
  final RxBool isLoadingLocation = false.obs;
  final RxString deviceInfo = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _repository = HomeRepository(this);
    _loadData();
  }

  Future<void> _loadData() async {
    await getDeviceInfo();
    await getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      isLoadingLocation.value = true;
      final position = await LocationService.getCurrentLocation();

      if (position != null) {
        currentPosition.value = position;
      } else {
        showSnackBar('Không thể lấy vị trí. Vui lòng bật GPS và cấp quyền');
      }
    } catch (e) {
      logger.e('Error getting location: $e');
      showSnackBar('Lỗi khi lấy vị trí: $e');
    } finally {
      isLoadingLocation.value = false;
    }
  }

  Future<void> getDeviceInfo() async {
    deviceInfo.value = await LocationService.getDeviceInfo();
  }

  Future<void> checkIn() async {
    if (currentPosition.value == null) {
      showSnackBar('Vui lòng chờ lấy vị trí GPS');
      return;
    }

    try {
      showLoading();

      final request = CheckInRequest(
        latitude: currentPosition.value!.latitude!,
        longitude: currentPosition.value!.longitude!,
        deviceInfo: deviceInfo.value,
      );

      final response = await _repository.checkIn(request);

      if (response.isSuccess) {
        showSnackBar('Check-in thành công');
        Get.back(result: true);
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error check-in: $e');
      showSnackBar('Có lỗi xảy ra khi check-in');
    } finally {
      hideLoading();
    }
  }

  Future<void> checkOut() async {
    if (currentPosition.value == null) {
      showSnackBar('Vui lòng chờ lấy vị trí GPS');
      return;
    }

    try {
      showLoading();

      final request = CheckInRequest(
        latitude: currentPosition.value!.latitude!,
        longitude: currentPosition.value!.longitude!,
        deviceInfo: deviceInfo.value,
      );

      final response = await _repository.checkOut(request);

      if (response.isSuccess) {
        showSnackBar('Check-out thành công');
        Get.back(result: true);
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e('Error check-out: $e');
      showSnackBar('Có lỗi xảy ra khi check-out');
    } finally {
      hideLoading();
    }
  }
}
