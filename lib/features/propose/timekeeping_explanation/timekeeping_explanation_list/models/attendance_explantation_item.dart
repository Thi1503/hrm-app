import 'package:do_an_application/features/propose/enums/request_status.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/models/explanation_type.dart';

class AttendanceExplanationItem {
  final int id;
  final int employeeId;
  final DateTime workDate;
  final ExplanationType explanationType;
  final String reason;
  final String attachmentUrl;
  final RequestStatus status;
  final DateTime createdAt;

  AttendanceExplanationItem({
    required this.id,
    required this.employeeId,
    required this.workDate,
    required this.explanationType,
    required this.reason,
    required this.attachmentUrl,
    required this.status,
    required this.createdAt,
  });

  factory AttendanceExplanationItem.fromJson(Map<String, dynamic> json) {
    return AttendanceExplanationItem(
      id: (json['id'] ?? 0).toInt(),
      employeeId: (json['employeeId'] ?? 0).toInt(),
      workDate: DateTime.parse(json['workDate']),
      explanationType: ExplanationType.fromValue(json['explanationType']),
      reason: json['reason'] ?? '',
      attachmentUrl: json['attachmentUrl'] ?? '',
      status: RequestStatus.fromValue(json['status']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
