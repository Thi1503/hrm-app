import 'package:do_an_application/const/const.dart';

class BaseResponseGeneric<T> {
  final int status;
  final String message;
  final T? data;
  final int? errorCode;

  const BaseResponseGeneric({
    required this.status,
    required this.message,
    this.data,
    this.errorCode,
  });

  factory BaseResponseGeneric.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic x)? func,
    String? dataKey,
  }) {
    final jsonData = json[dataKey ?? 'Data'];
    return BaseResponseGeneric(
      status: json['Status'] ?? 0,
      message: json['Message'] ?? '',
      data: jsonData != null && func != null ? func(jsonData) : jsonData,
      errorCode: json['ErrorCode'] ?? 0,
    );
  }

  bool get isSuccess => status == AppConst.responseSuccess;
}
