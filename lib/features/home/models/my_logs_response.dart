import 'package:do_an_application/features/home/models/attendance_log.dart';

class MyLogsResponse {
  final List<AttendanceLog> logs;

  MyLogsResponse({required this.logs});

  factory MyLogsResponse.fromJson(List<dynamic> json) {
    return MyLogsResponse(
      logs: json.map((e) => AttendanceLog.fromJson(e)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return logs.map((e) => e.toJson()).toList();
  }

  // Helper methods
  List<AttendanceLog> get validLogs =>
      logs.where((log) => log.validLocation).toList();

  List<AttendanceLog> get invalidLogs =>
      logs.where((log) => !log.validLocation).toList();

  List<AttendanceLog> get checkInLogs =>
      logs.where((log) => log.checkType.isCheckIn).toList();

  List<AttendanceLog> get checkOutLogs =>
      logs.where((log) => log.checkType.isCheckOut).toList();

  AttendanceLog? get latestCheckIn => checkInLogs.isNotEmpty
      ? checkInLogs.reduce((a, b) => a.checkTime.isAfter(b.checkTime) ? a : b)
      : null;

  AttendanceLog? get latestCheckOut => checkOutLogs.isNotEmpty
      ? checkOutLogs.reduce((a, b) => a.checkTime.isAfter(b.checkTime) ? a : b)
      : null;
}
