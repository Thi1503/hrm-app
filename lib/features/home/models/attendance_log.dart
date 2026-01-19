import 'package:do_an_application/features/home/models/check_type.dart';

class AttendanceLog {
  final DateTime checkTime;
  final CheckType checkType;
  final bool validLocation;
  final String locationName;

  AttendanceLog({
    required this.checkTime,
    required this.checkType,
    required this.validLocation,
    required this.locationName,
  });

  factory AttendanceLog.fromJson(Map<String, dynamic> json) {
    return AttendanceLog(
      checkTime: DateTime.parse(json['checkTime']),
      checkType: CheckType.fromValue(json['checkType']),
      validLocation: json['validLocation'] ?? false,
      locationName: json['locationName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'checkTime': checkTime.toIso8601String(),
      'checkType': checkType.value,
      'validLocation': validLocation,
      'locationName': locationName,
    };
  }
}
