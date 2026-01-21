import '../enums/request_type.dart';

class ApprovalRequest {
  final RequestType requestType;
  final int requestId;
  final String comment;

  ApprovalRequest({
    required this.requestType,
    required this.requestId,
    this.comment = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'requestType': requestType.value,
      'requestId': requestId,
      'comment': comment,
    };
  }
}
