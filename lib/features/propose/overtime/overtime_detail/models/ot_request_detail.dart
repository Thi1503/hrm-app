import 'package:do_an_application/features/propose/enums/request_status.dart';

class OtRequestDetail {
  final int id;
  final int employeeId;
  final String employeeName;
  final String otDate;
  final String startTime;
  final String endTime;
  final double totalHours;
  final String reason;
  final RequestStatus status;
  final String createdAt;
  final String? managerComment;
  final String? hrComment;
  final String? managerName;
  final String? hrName;

  OtRequestDetail({
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.otDate,
    required this.startTime,
    required this.endTime,
    required this.totalHours,
    required this.reason,
    required this.status,
    required this.createdAt,
    this.managerComment,
    this.hrComment,
    this.managerName,
    this.hrName,
  });

  factory OtRequestDetail.fromJson(Map<String, dynamic> json) {
    return OtRequestDetail(
      id: json['id'] ?? 0,
      employeeId: json['employeeId'] ?? 0,
      employeeName: json['employeeName'] ?? '',
      otDate: json['otDate'] ?? '',
      startTime: _parseTimeToString(json['startTime']),
      endTime: _parseTimeToString(json['endTime']),
      totalHours: (json['totalHours'] ?? 0).toDouble(),
      reason: json['reason'] ?? '',
      status: RequestStatus.fromValue(json['status'] ?? 'PENDING_MANAGER'),
      createdAt: json['createdAt'] ?? '',
      managerComment: json['managerComment'],
      hrComment: json['hrComment'],
      managerName: json['managerName'],
      hrName: json['hrName'],
    );
  }

  static String _parseTimeToString(dynamic timeData) {
    if (timeData is Map) {
      final hour = (timeData['hour'] ?? 0).toString().padLeft(2, '0');
      final minute = (timeData['minute'] ?? 0).toString().padLeft(2, '0');
      return '$hour:$minute';
    } else if (timeData is String) {
      return timeData;
    }
    return '00:00';
  }
}
