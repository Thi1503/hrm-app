import 'dart:io';
import 'package:location/location.dart' as loc;
import 'package:device_info_plus/device_info_plus.dart';

class LocationService {
  static final loc.Location _location = loc.Location();

  static Future<bool> requestLocationPermission() async {
    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return false;
      }
    }

    return true;
  }

  static Future<loc.LocationData?> getCurrentLocation() async {
    try {
      final hasPermission = await requestLocationPermission();

      if (!hasPermission) {
        return null;
      }

      return await _location.getLocation();
    } catch (e) {
      return null;
    }
  }

  static Future<String> getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        return 'Android - ${androidInfo.brand} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return 'iOS - ${iosInfo.model}';
      }
      return 'Unknown Device';
    } catch (e) {
      return 'Unknown Device';
    }
  }
}
