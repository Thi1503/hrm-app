import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/models/explanation_type.dart';
import 'package:do_an_application/utils/date_utils.dart';

class CreateExplanationRequest {
  final DateTime workDate;
  final ExplanationType explanationType;
  final String reason;
  final String? attachmentUrl;

  CreateExplanationRequest({
    required this.workDate,
    required this.explanationType,
    required this.reason,
    this.attachmentUrl,
  });

  factory CreateExplanationRequest.fromJson(Map<String, dynamic> json) {
    return CreateExplanationRequest(
      workDate: DateTime.parse(json['workDate'] ?? ''),
      explanationType: ExplanationType.fromValue(json['explanationType']),
      reason: json['reason'] ?? '',
      attachmentUrl: json['attachmentUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workDate': convertDateToStringDefault(workDate),
      'explanationType': explanationType.value,
      'reason': reason,
      'attachmentUrl': attachmentUrl ?? '',
    };
  }
}
