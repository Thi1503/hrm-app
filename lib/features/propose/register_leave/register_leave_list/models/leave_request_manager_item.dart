import 'package:do_an_application/features/propose/enums/request_status.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/models/leave_type.dart';

class LeaveRequestManagerItem {
  final int requestId;
  final int employeeId;
  final String employeeName;
  final LeaveType leaveType;
  final DateTime fromDate;
  final DateTime toDate;
  final String reason;
  final RequestStatus status;

  LeaveRequestManagerItem({
    required this.requestId,
    required this.employeeId,
    required this.employeeName,
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    required this.reason,
    required this.status,
  });

  factory LeaveRequestManagerItem.fromJson(Map<String, dynamic> json) {
    return LeaveRequestManagerItem(
      requestId: (json['requestId'] ?? 0).toInt(),
      employeeId: (json['employeeId'] ?? 0).toInt(),
      employeeName: json['employeeName'] ?? '',
      leaveType: LeaveType.fromValue(json['leaveType']),
      fromDate: DateTime.parse(json['fromDate']),
      toDate: DateTime.parse(json['toDate']),
      reason: json['reason'] ?? '',
      status: RequestStatus.fromValue(json['status']),
    );
  }
}
