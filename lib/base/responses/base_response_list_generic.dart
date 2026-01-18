class BaseResponseListGeneric<T> {
  final bool success;
  final String? code;
  final String message;
  final List<T> data;

  const BaseResponseListGeneric({
    required this.success,
    this.code,
    required this.message,
    required this.data,
  });

  factory BaseResponseListGeneric.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic x)? func,
    String? dataKey,
  }) {
    final key = dataKey ?? 'data';
    final raw = json.containsKey(key) ? json[key] : json['Data'];

    List<T> parsed;
    if (raw is List) {
      if (func != null) {
        parsed = List<T>.from(raw.map((x) => func(x)));
      } else {
        parsed = <T>[];
      }
    } else {
      parsed = <T>[];
    }

    return BaseResponseListGeneric(
      success: json['success'] == true || (json['Status'] == 2),
      code: (json['code'] as String?) ?? (json['ErrorCode']?.toString()),
      message:
          (json['message'] as String?) ?? (json['Message'] as String?) ?? '',
      data: parsed,
    );
  }

  bool get isSuccess => success;

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'message': message,
        'data': data,
      };
}
