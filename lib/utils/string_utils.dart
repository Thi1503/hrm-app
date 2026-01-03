import 'package:tiengviet/tiengviet.dart';

extension StringExt on String {
  String get tel {
    return 'tel:$this';
  }

  /// Xóa dấu tiếng Việt
  String get removeDiacritics {
    return TiengViet.parse(this);
  }

  /// REF: https://jira-sds.softdreams.vn:8080/browse/EIMQLHD-845
  ///
  /// Là mã số thuế hoặc căn cước công dân hợp lệ
  ///
  /// Chỉ check độ dài của chuỗi và không kiểm tra định dạng cụ thể.
  bool get isValidTaxCodeOrCitizenId {
    return isValidTaxCode || isValidCitizenId;
  }

  bool get isValidTaxCode {
    final trimmed = trim();

    // Mã số thuế không được kết thúc bằng dấu '-'
    if (trimmed.endsWith('-')) {
      return false;
    }

    // Mã số thuế có 10 ký tự hoặc 14 ký tự
    if (trimmed.length == 10 || trimmed.length == 14) {
      return true;
    }

    return false;
  }

  bool get isValidCitizenId {
    final trimmed = trim();

    // Là căn cước công dân hợp lệ
    if (trimmed.length == 12 && !trimmed.contains('-')) {
      return true;
    }

    return false;
  }
}
