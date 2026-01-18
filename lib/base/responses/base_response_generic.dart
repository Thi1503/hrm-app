class BaseResponseGeneric<T> {
  final bool success;
  final String? code;
  final String message;
  final T? data;

  const BaseResponseGeneric({
    required this.success,
    this.code,
    required this.message,
    this.data,
  });

  factory BaseResponseGeneric.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic x)? func,
    String? dataKey,
  }) {
    final key = dataKey ?? 'data';
    final jsonData = json.containsKey(key) ? json[key] : json['Data'];
    return BaseResponseGeneric(
      success: json['success'] == true || (json['Status'] == 2),
      code: (json['code'] as String?) ?? (json['ErrorCode']?.toString()),
      message:
          (json['message'] as String?) ?? (json['Message'] as String?) ?? '',
      data: jsonData != null && func != null ? func(jsonData) : jsonData,
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
