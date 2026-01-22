import 'package:do_an_application/utils/date_utils.dart';

class CreateOtRequest {
  final DateTime otDate;
  final OtTime startTime;
  final OtTime endTime;
  final String reason;

  CreateOtRequest({
    required this.otDate,
    required this.startTime,
    required this.endTime,
    required this.reason,
  });

  factory CreateOtRequest.fromJson(Map<String, dynamic> json) {
    return CreateOtRequest(
      otDate: DateTime.parse(json['otDate'] ?? ''),
      startTime: _parseTime(json['startTime']),
      endTime: _parseTime(json['endTime']),
      reason: json['reason'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'otDate': convertDateToStringDefault(otDate),
      'startTime': '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}:00',
      'endTime': '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}:00',
      'reason': reason,
    };
  }

  static OtTime _parseTime(dynamic timeData) {
    if (timeData is Map) {
      return OtTime(
        hour: timeData['hour'] ?? 0,
        minute: timeData['minute'] ?? 0,
      );
    } else if (timeData is String) {
      final parts = timeData.split(':');
      return OtTime(
        hour: int.tryParse(parts[0]) ?? 0,
        minute: int.tryParse(parts[1]) ?? 0,
      );
    }
    return const OtTime(hour: 0, minute: 0);
  }
}

class OtTime {
  final int hour;
  final int minute;

  const OtTime({required this.hour, required this.minute});

  @override
  String toString() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}
