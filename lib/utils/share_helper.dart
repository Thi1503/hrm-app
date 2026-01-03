import 'package:flutter/services.dart';

import 'utils.dart';

class ShareHelper {
  static const platform = MethodChannel('vn.softdreams.share/share');

  static Future<void> sharePdfFile(String fileString) async {
    try {
      await platform.invokeMethod('shareFile', {
        'path': fileString,
        'mime': 'application/pdf',
      });
    } on PlatformException catch (e) {
      logger.e("Failed to share: '${e.message}'.");
    }
  }
}
