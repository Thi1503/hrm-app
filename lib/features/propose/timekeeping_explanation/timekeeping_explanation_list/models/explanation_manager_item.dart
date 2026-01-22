import 'package:do_an_application/features/propose/enums/request_status.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/models/explanation_type.dart';

class ExplanationManagerItem {
  final int requestId;
  final int employeeId;
  final String employeeName;
  final DateTime workDate;
  final ExplanationType explanationType;
  final String reason;
  final RequestStatus status;

  ExplanationManagerItem({
    required this.requestId,
    required this.employeeId,
    required this.employeeName,
    required this.workDate,
    required this.explanationType,
    required this.reason,
    required this.status,
  });

  factory ExplanationManagerItem.fromJson(Map<String, dynamic> json) {
    return ExplanationManagerItem(
      requestId: (json['requestId'] ?? 0).toInt(),
      employeeId: (json['employeeId'] ?? 0).toInt(),
      employeeName: json['employeeName'] ?? '',
      workDate: DateTime.parse(json['workDate']),
      explanationType: ExplanationType.fromValue(json['explanationType']),
      reason: json['reason'] ?? '',
      status: RequestStatus.fromValue(json['status']),
    );
  }
}
