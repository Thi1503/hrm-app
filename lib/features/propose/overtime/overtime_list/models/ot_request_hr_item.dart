import 'package:do_an_application/features/propose/enums/request_status.dart';

class OtRequestHrItem {
  final int requestId;
  final DateTime otDate;
  final DateTime startTime;
  final DateTime endTime;
  final String reason;
  final RequestStatus status;
  final int employeeId;
  final String employeeName;
  final int managerId;
  final String managerName;
  final int departmentId;
  final String departmentName;
  final int positionId;
  final String positionName;

  OtRequestHrItem({
    required this.requestId,
    required this.otDate,
    required this.startTime,
    required this.endTime,
    required this.reason,
    required this.status,
    required this.employeeId,
    required this.employeeName,
    required this.managerId,
    required this.managerName,
    required this.departmentId,
    required this.departmentName,
    required this.positionId,
    required this.positionName,
  });

  factory OtRequestHrItem.fromJson(Map<String, dynamic> json) {
    return OtRequestHrItem(
      requestId: (json['requestId'] ?? 0).toInt(),
      otDate: DateTime.parse(json['otDate']),
      startTime: _parseTime(json['startTime']),
      endTime: _parseTime(json['endTime']),
      reason: json['reason'] ?? '',
      status: RequestStatus.fromValue(json['status']),
      employeeId: (json['employeeId'] ?? 0).toInt(),
      employeeName: json['employeeName'] ?? '',
      managerId: (json['managerId'] ?? 0).toInt(),
      managerName: json['managerName'] ?? '',
      departmentId: (json['departmentId'] ?? 0).toInt(),
      departmentName: json['departmentName'] ?? '',
      positionId: (json['positionId'] ?? 0).toInt(),
      positionName: json['positionName'] ?? '',
    );
  }

  static DateTime _parseTime(dynamic time) {
    if (time is String) {
      // Format: "18:00:00"
      final parts = time.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      final second = int.parse(parts[2]);
      
      return DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        hour,
        minute,
        second,
      );
    } else if (time is Map<String, dynamic>) {
      // Format: {hour: 18, minute: 0, second: 0, nano: 0}
      final hour = time['hour'] ?? 0;
      final minute = time['minute'] ?? 0;
      final second = time['second'] ?? 0;
      final nano = time['nano'] ?? 0;

      return DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        hour,
        minute,
        second,
        0,
        nano ~/ 1000000,
      );
    }
    return DateTime.now();
  }
}
