import 'package:do_an_application/features/propose/enums/request_status.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/models/leave_type.dart';

class LeaveRequestItem {
  final int id;
  final int employeeId;
  final LeaveType leaveType;
  final DateTime fromDate;
  final DateTime toDate;
  final int totalDays;
  final String reason;
  final String attachmentUrl;
  final RequestStatus status;
  final DateTime createdAt;

  LeaveRequestItem({
    required this.id,
    required this.employeeId,
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    required this.totalDays,
    required this.reason,
    required this.attachmentUrl,
    required this.status,
    required this.createdAt,
  });

  factory LeaveRequestItem.fromJson(Map<String, dynamic> json) {
    return LeaveRequestItem(
      id: json['id'] ?? 0,
      employeeId: json['employeeId'] ?? 0,
      leaveType: LeaveType.fromValue(json['leaveType']),
      fromDate: DateTime.parse(json['fromDate']),
      toDate: DateTime.parse(json['toDate']),
      totalDays: json['totalDays'] ?? 0,
      reason: json['reason'] ?? '',
      attachmentUrl: json['attachmentUrl'] ?? '',
      status: RequestStatus.fromValue(json['status']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employeeId': employeeId,
      'leaveType': leaveType.value,
      'fromDate': fromDate.toIso8601String().split('T')[0],
      'toDate': toDate.toIso8601String().split('T')[0],
      'totalDays': totalDays,
      'reason': reason,
      'attachmentUrl': attachmentUrl,
      'status': status.value,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
