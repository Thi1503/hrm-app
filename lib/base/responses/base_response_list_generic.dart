class BaseResponseListGeneric<T> {
  final int status;
  final String message;
  final List<T> data;
  final int? errorCode;

  const BaseResponseListGeneric({
    required this.status,
    required this.message,
    required this.data,
    this.errorCode,
  });

  factory BaseResponseListGeneric.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic x)? func,
    String? dataKey,
  }) {
    final jsonData = json[dataKey ?? 'Data'];
    return BaseResponseListGeneric(
      status: json['Status'] ?? 0,
      message: json['Message'] ?? '',
      data: jsonData != null && func != null
          ? List<T>.from(jsonData.map((x) => func(x)))
          : <T>[],
      errorCode: json['ErrorCode'],
    );
  }
}
