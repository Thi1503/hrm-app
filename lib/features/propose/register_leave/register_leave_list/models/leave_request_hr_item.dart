import 'package:do_an_application/features/propose/enums/request_status.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/models/leave_type.dart';

class LeaveRequestHrItem {
  final int requestId;
  final int employeeId;
  final String employeeName;
  final int managerId;
  final String managerName;
  final int departmentId;
  final String departmentName;
  final int positionId;
  final String positionName;
  final LeaveType leaveType;
  final DateTime fromDate;
  final DateTime toDate;
  final String reason;
  final RequestStatus status;

  LeaveRequestHrItem({
    required this.requestId,
    required this.employeeId,
    required this.employeeName,
    required this.managerId,
    required this.managerName,
    required this.departmentId,
    required this.departmentName,
    required this.positionId,
    required this.positionName,
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    required this.reason,
    required this.status,
  });

  factory LeaveRequestHrItem.fromJson(Map<String, dynamic> json) {
    return LeaveRequestHrItem(
      requestId: (json['requestId'] ?? 0).toInt(),
      employeeId: (json['employeeId'] ?? 0).toInt(),
      employeeName: json['employeeName'] ?? '',
      managerId: (json['managerId'] ?? 0).toInt(),
      managerName: json['managerName'] ?? '',
      departmentId: (json['departmentId'] ?? 0).toInt(),
      departmentName: json['departmentName'] ?? '',
      positionId: (json['positionId'] ?? 0).toInt(),
      positionName: json['positionName'] ?? '',
      leaveType: LeaveType.fromValue(json['leaveType']),
      fromDate: DateTime.parse(json['fromDate']),
      toDate: DateTime.parse(json['toDate']),
      reason: json['reason'] ?? '',
      status: RequestStatus.fromValue(json['status']),
    );
  }
}
