import 'package:do_an_application/features/propose/register_leave/register_leave_list/models/leave_type.dart';
import 'package:do_an_application/utils/date_utils.dart';

class RegisterLeaveRequest {
  final LeaveType leaveType;
  final DateTime fromDate;
  final DateTime toDate;
  final String reason;
  final String? attachmentUrl;

  RegisterLeaveRequest({
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    required this.reason,
    this.attachmentUrl,
  });

  factory RegisterLeaveRequest.fromJson(Map<String, dynamic> json) {
    return RegisterLeaveRequest(
      leaveType: LeaveType.fromValue(json['leaveType']),
      fromDate: DateTime.parse(json['fromDate'] ?? ''),
      toDate: DateTime.parse(json['toDate'] ?? ''),
      reason: json['reason'] ?? '',
      attachmentUrl: json['attachmentUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'leaveType': leaveType.value,
      'fromDate': convertDateToStringDefault(fromDate),
      'toDate': convertDateToStringDefault(toDate),
      'reason': reason,
      'attachmentUrl': attachmentUrl,
    };
  }
}
