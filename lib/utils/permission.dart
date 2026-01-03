import 'dart:io';
import 'dart:typed_data';

import 'package:do_an_application/generated/locales.g.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sds_share_pdf/sds_share_pdf.dart';
import 'package:share_plus/share_plus.dart';

import '../base/controllers/base_controller.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

Future<PermissionStatus> checkPermission(
    List<Permission> listPermission) async {
  PermissionStatus status = PermissionStatus.granted;
  Map<Permission, PermissionStatus> statuses = await listPermission.request();
  for (var value in statuses.values) {
    if (value == PermissionStatus.permanentlyDenied) {
      status = PermissionStatus.permanentlyDenied;
      break;
    }
    if (value == PermissionStatus.denied) {
      status = PermissionStatus.denied;
      break;
    }
    // if (value == PermissionStatus.undetermined) {
    //   status = PermissionStatus.undetermined;
    //   break;
    // }
  }
  return status;
}

Future<String> getPath(String fileName) async {
  String path = await getTemporaryDirectory().then((value) => value.path);

  return '$path${Platform.pathSeparator}$fileName';
}

Future<String> saveFile(String fileName, Uint8List bytes) async {
  File file = File(await getPath(fileName));
  file.writeAsBytes(bytes);

  return file.path;
}

Future<void> shareFile(String fileName, Uint8List bytes) async {
  if (GetPlatform.isAndroid) {
    final fileString = await saveFile(fileName, bytes);
    await SdsSharePdf.sharePdf(fileString);
  } else {
    XFile file = XFile.fromData(
      bytes,
      mimeType: "pdf",
      name: fileName,
    );
    await Share.shareXFiles(
      [file],
    );
  }
}

DateTime? _currentBackPressTime;
bool onWillPop() {
  DateTime now = DateTime.now();
  if (_currentBackPressTime == null ||
      now.difference(_currentBackPressTime ?? DateTime.now()) >
          const Duration(seconds: 2)) {
    _currentBackPressTime = now;
    Fluttertoast.showToast(msg: LocaleKeys.app_exitApp.tr);
    return false;
  }
  return true;
}

bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

void openFile(BaseGetxController controller, List<int> value,
    {bool isSign = false, Function? function}) {
  if (!controller.isClosed) {
    // Get.to(
    //   () => isSign ? PdfSignPage(value) : PdfPage(value),
    // )?.then((value) => function?.call());
  }
}

Future<void> shareFilePDF(
  BaseGetxController controller,
  String fileName,
  List<int> value, {
  bool isSigned = false,
}) async {
  // Hiện tại đang bị lỗi không chia sẻ được trên ipad nên sẽ sử dụng open file để mở dạng hệ thống
  if (Get.context!.isTablet || isSigned) {
    String path = await saveFile(fileName, Uint8List.fromList(value));
    if (path.isNotEmpty) {
      OpenFile.open(path);
    }
  } else {
    openFile(controller, value);
  }
}
