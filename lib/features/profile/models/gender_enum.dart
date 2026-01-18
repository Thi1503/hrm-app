import 'package:get/get.dart';

enum Gender {
  male('MALE', 'Nam'),
  female('FEMALE', 'Nữ'),
  other('OTHER', 'Giới tính khác');

  final String value;
  final String displayName;

  const Gender(this.value, this.displayName);

  /// Convert từ backend value sang enum
  static Gender? fromValue(String? value) {
    if (value == null) return Gender.other;

    try {
      return Gender.values.firstWhereOrNull(
        (e) => e.value.toUpperCase() == value.toUpperCase(),
      );
    } catch (_) {
      return Gender.other;
    }
  }

  /// Convert từ display name sang enum
  static Gender? fromDisplayName(String? displayName) {
    if (displayName == null) return null;

    try {
      return Gender.values.firstWhereOrNull(
        (e) => e.displayName == displayName,
      );
    } catch (_) {
      return null;
    }
  }

  bool get isMale => this == Gender.male;
  bool get isFemale => this == Gender.female;
  bool get isOther => this == Gender.other;
}
