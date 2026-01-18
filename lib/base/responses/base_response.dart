class BaseResponse {
  final bool success;
  final String? code;
  final String message;
  final dynamic data;

  BaseResponse({
    required this.success,
    this.code,
    required this.message,
    this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      success: json['success'] == true,
      code: json['code'] as String?,
      message: json['message'] as String? ?? '',
      data: json['data'],
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
