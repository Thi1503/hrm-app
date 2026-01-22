import 'package:do_an_application/features/propose/enums/request_status.dart';

class OtRequestItem {
  final int id;
  final int employeeId;
  final DateTime otDate;
  final DateTime startTime;
  final DateTime endTime;
  final double totalHours;
  final String reason;
  final RequestStatus status;
  final DateTime createdAt;

  OtRequestItem({
    required this.id,
    required this.employeeId,
    required this.otDate,
    required this.startTime,
    required this.endTime,
    required this.totalHours,
    required this.reason,
    required this.status,
    required this.createdAt,
  });

  factory OtRequestItem.fromJson(Map<String, dynamic> json) {
    return OtRequestItem(
      id: (json['id'] ?? 0).toInt(),
      employeeId: (json['employeeId'] ?? 0).toInt(),
      otDate: DateTime.parse(json['otDate']),
      startTime: _parseTime(json['startTime']),
      endTime: _parseTime(json['endTime']),
      totalHours: (json['totalHours'] ?? 0).toDouble(),
      reason: json['reason'] ?? '',
      status: RequestStatus.fromValue(json['status']),
      createdAt: DateTime.parse(json['createdAt']),
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
