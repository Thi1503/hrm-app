import 'package:do_an_application/features/propose/enums/request_status.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/models/explanation_type.dart';

class ExplanationHrItem {
  final int requestId;
  final DateTime workDate;
  final ExplanationType explanationType;
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

  ExplanationHrItem({
    required this.requestId,
    required this.workDate,
    required this.explanationType,
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

  factory ExplanationHrItem.fromJson(Map<String, dynamic> json) {
    return ExplanationHrItem(
      requestId: (json['requestId'] ?? 0).toInt(),
      workDate: DateTime.parse(json['workDate']),
      explanationType: ExplanationType.fromValue(json['explanationType']),
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
}
