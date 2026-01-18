import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart' as crypto;
import 'package:dio/dio.dart';
import 'package:dio_log_sds/dio_log_sds.dart';
import 'package:do_an_application/base/controllers/base_controller.dart';
import 'package:do_an_application/const/const.dart';
import 'package:do_an_application/utils/dio_log.dart';

import '../../application/app_controller.dart';

enum RequestMethod { POST, GET, DELETE, PUT }

/// 2 years in milliseconds
const _godModeTimeShift = 63072000000;

class BaseRequest {
  static Dio dio = getBaseDio();

  /// if `enableGodMode` is `true`, user can change device time freely
  static bool enableGodMode = false;

  static Dio getBaseDio() {
    Dio dio = Dio();

    dio.options = buildDefaultOptions();
    if (Diolog().showDebug) {
      dio.interceptors.add(SDSDioLogInterceptor());
    }

    // dio.httpClientAdapter = IOHttpClientAdapter(
    //   createHttpClient: () {
    //     final client = HttpClient();
    //     // Config the client.
    //     client.findProxy = (uri) {
    //       // Forward all request to proxy "localhost:8888".
    //       // Be aware, the proxy should went through you running device,
    //       // not the host platform.
    //       return 'PROXY localhost:8888';
    //     };
    //     // You can also create a new HttpClient for Dio instead of returning,
    //     // but a client must being returned here.
    //     return client;
    //   },
    // );
    return dio;
  }

  static BaseOptions buildDefaultOptions() {
    return BaseOptions()
      ..connectTimeout = const Duration(milliseconds: AppConst.requestTimeOut)
      ..receiveTimeout = const Duration(milliseconds: AppConst.requestTimeOut);
  }

  static void close() {
    dio.close(force: true);
    updateCurrentDio();
  }

  static void updateCurrentDio() {
    dio = getBaseDio();
  }

  static Dio getCurrentDio() {
    return dio;
  }

  void setOnErrorListener(Function(Object error) onErrorCallBack) {
    this.onErrorCallBack = onErrorCallBack;
  }

  late Function(Object error) onErrorCallBack;

  /// [isQueryParametersPost]: `true`: phương thức post gửi params, mặc định = `false`
  ///
  /// [dioOptions]: option của Dio() sử dụng khi gọi api có option riêng
  ///
  /// [functionError]: chạy function riêng khi request xảy ra Exception (mặc định sử dụng [showDialogError])
  Future<dynamic> sendRequest(
    String action,
    RequestMethod requestMethod, {
    dynamic jsonMap,
    bool isDownload = false,
    String? urlOther,
    Map<String, String>? headersUrlOther,
    bool isQueryParametersPost = false,
    required BaseGetxController controller,
    BaseOptions? dioOptions,
    Function(Object error)? functionError,
    bool enableChunkedTransfer = false,
  }) async {
    dio.options = dioOptions ?? buildDefaultOptions();

    Response response;
    String url = urlOther ?? (AppConst.baseUrl + action);
    Map<String, String> headers =
        headersUrlOther ?? await getBaseHeader(requestMethod.name);
    if (enableChunkedTransfer) {
      // Set Transfer-Encoding là 'chunked' để BE tự tính content-length, nhằm tránh lỗi sai content-length
      // Nhưng sẽ không thêm vào khi gọi api upload file vì sẽ bị lỗi "Connection closed before full header was received"
      headers['Transfer-Encoding'] = 'chunked';
    }
    Options options = isDownload
        ? Options(
            headers: headers,
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status != null && status < 500;
            })
        : Options(
            headers: headers,
            method: requestMethod.toString(),
            responseType: ResponseType.json,
          );

    final cancelToken = CancelToken();
    controller.addCancelToken(cancelToken);
    try {
      if (requestMethod == RequestMethod.POST) {
        if (isQueryParametersPost) {
          response = await dio.post(
            url,
            queryParameters: jsonMap,
            options: options,
            cancelToken: cancelToken,
          );
        } else {
          response = await dio.post(
            url,
            data: jsonMap,
            options: options,
            cancelToken: cancelToken,
          );
        }
      } else {
        response = await dio.get(
          url,
          queryParameters: jsonMap,
          options: options,
          cancelToken: cancelToken,
        );
      }
      return response.data;
    } catch (e) {
      controller.cancelRequest(cancelToken);

      return functionError != null ? functionError(e) : showDialogError(e);
    }
  }

  dynamic showDialogError(dynamic e) {
    if (e.response?.data != null &&
        e.response.data is Map &&
        e.response.data["Data"] != null) {
      return e.response.data;
    }
    onErrorCallBack(e);
  }

  Future<Map<String, String>> getBaseHeader(String httpMethod) async {
    final authentication = await getAuthentication(httpMethod);
    return {
      "Content-Type": "application/json",
      // 'Admin-Agent': 'iinvoice.vn',
      'Authentication': authentication,
    };
  }

  ///
  /// @params username: login username store in Hive
  /// @params password: login password store in Hive
  /// @params timestamp: current milliseconds
  /// @params nonce: random 32 characters between [a-A,0-9]
  /// @params signature: base64Encode of md5 (httpMethod + timeStamp + nonce)
  ///
  Future<String> getAuthentication(String httpMethod) async {
    final taxCode = '${HIVE_APP.get(AppConst.keyTaxCodeCompany)}';
    final username = '${HIVE_APP.get(AppConst.keyUserName)}';
    final password = '${HIVE_APP.get(AppConst.keyPassword)}';

    final int millisecondsDiff = enableGodMode ? _godModeTimeShift : 0;

    final timeStamp =
        ((DateTime.now().millisecondsSinceEpoch + millisecondsDiff) ~/ 1000)
            .toString();
    final nonce = _makeId();
    final signatureRawData =
        httpMethod.toUpperCase() + timeStamp + nonce.toString();
    final signature =
        base64Encode(crypto.md5.convert((utf8.encode(signatureRawData))).bytes);
    return "$signature:$nonce:$timeStamp:$username:$password:$taxCode";
  }

  String _makeId() {
    final text = StringBuffer();
    const possible =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    for (int i = 0; i <= 32; i++) {
      text.write(possible[Random().nextInt(possible.length)]);
    }
    return text.toString();
  }
}
