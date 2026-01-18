import 'dart:convert';

class JwtHelper {
  static Map<String, dynamic>? decodeToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        return null;
      }

      final payload = parts[1];
      var normalized = base64Url.normalize(payload);
      var decoded = utf8.decode(base64Url.decode(normalized));

      return json.decode(decoded) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  static String? getUsername(String token) {
    final payload = decodeToken(token);
    return payload?['username'] as String?;
  }

  static String? getUserId(String token) {
    final payload = decodeToken(token);
    return payload?['userId'] as String?;
  }

  static List<String> getRoles(String token) {
    final payload = decodeToken(token);
    final roles = payload?['roles'];

    if (roles is List) {
      return roles.map((e) => e.toString()).toList();
    }

    return [];
  }

  static String? getFirstRole(String token) {
    final roles = getRoles(token);
    return roles.isNotEmpty ? roles.first : null;
  }

  static List<String> getPermissions(String token) {
    final payload = decodeToken(token);
    final permissions = payload?['permissions'];

    if (permissions is List) {
      return permissions.map((e) => e.toString()).toList();
    }

    return [];
  }

  static int? getEmployeeId(String token) {
    final payload = decodeToken(token);
    return payload?['employeeId'] as int?;
  }

  static String? getEmployeeName(String token) {
    final payload = decodeToken(token);
    return payload?['employeeName'] as String?;
  }

  static bool isTokenExpired(String token) {
    final payload = decodeToken(token);
    if (payload == null) return true;

    final exp = payload['exp'] as int?;
    if (exp == null) return true;

    final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    return DateTime.now().isAfter(expiryDate);
  }
}
