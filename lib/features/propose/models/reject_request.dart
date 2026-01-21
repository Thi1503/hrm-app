import '../enums/request_type.dart';

class RejectRequest {
  final RequestType requestType;
  final int requestId;
  final String comment;

  RejectRequest({
    required this.requestType,
    required this.requestId,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'requestType': requestType.value,
      'requestId': requestId,
      'comment': comment,
    };
  }
}
