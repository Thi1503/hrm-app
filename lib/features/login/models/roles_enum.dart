import 'package:get/get.dart';

enum UserRole {
  admin('ADMIN'),
  employee('EMPLOYEE'),
  hr('HR'),
  manager('MANAGER');

  final String value;

  const UserRole(this.value);

  static UserRole? fromString(String? role) {
    if (role == null) return UserRole.employee;

    try {
      return UserRole.values.firstWhereOrNull(
        (e) => e.value.toLowerCase() == role.toLowerCase(),
      );
    } catch (_) {
      return UserRole.employee;
    }
  }

  bool get isAdmin => this == UserRole.admin;
  bool get isEmployee => this == UserRole.employee;
  bool get isHR => this == UserRole.hr;
  bool get isManager => this == UserRole.manager;
}
