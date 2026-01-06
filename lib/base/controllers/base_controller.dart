import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:do_an_application/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../application/app_controller_src.dart';
import '../../const/all_const.dart';
import '../../utils/utils.dart';
import '../requests/requests.dart';
import '../responses/response_error.dart';

class BaseGetxController extends GetxController {
  final isShowLoading = false.obs;
  String errorContent = '';
  final baseRequestController = Get.find<BaseRequest>();

  ///1 CancelToken để huỷ 1 request.
  ///1 màn hình gắn với 1 controller, 1 controller có nhiều requests khi huỷ 1 màn hình => huỷ toàn bộ requests `INCOMPLETED` tại màn hình đó.
  final cancelTokens = <CancelToken>[];

  /// Sử dụng một số màn bắt buộc sử dụng loading overlay
  final isLoadingOverlay = false.obs;

  /// Sử dụng cho demo78 phát hành hóa đơn có mã
  final isLoadingOverlayIssue = false.obs;

  /// Sử dụng cho demo78 phát hành thành công hóa đơn
  final isIssueSuccess = false.obs;

  final isDarkMode = AppColors.isDarkMode.obs;

  final isLanguageVN = RxBool(APP_DATA.read(AppConst.keyLanguageIsVN) ?? true);

  void showLoading() {
    isShowLoading.value = true;
  }

  void hideLoading() {
    isShowLoading.value = false;
  }

  void showLoadingOverlay() {
    isLoadingOverlay.value = true;
  }

  void hideLoadingOverlay() {
    isLoadingOverlay.value = false;
  }

  void _setOnErrorListener() {
    baseRequestController.setOnErrorListener((error) {
      String? errorFix;
      errorContent = AppStr.errorConnectFailedStr.tr;
      if (error is DioException) {
        //Nếu server có trả về message thì hiển thị
        if (error.response?.data != null &&
            error.response!.data is Map &&
            error.response!.data["Message"] != null) {
          // trường hợp tài khoản không hợp lệ thì thông báo khách hàng đăng nhập lại
          final errorResponse =
              getErrorMessage(error.response!.data['ErrorCode']);

          // Đoc thông báo lỗi từ server, nếu không có thì lấy từ lấy từ local
          // BE đã confirm là với các code đã trả về đúng Message lỗi cho các đầu API
          // https://docs.google.com/document/d/1kZD5flrTxMWNKOSn5Ap2mYFLBOEr5iSM4P0EhBl1G6M/edit?tab=t.0
          errorContent =
              error.response!.data['Message'] ?? errorResponse?.errorUser ?? '';
          errorFix = errorResponse?.errorFix;
        } else {
          switch (error.type) {
            case DioExceptionType.connectionTimeout:
            case DioExceptionType.sendTimeout:
            case DioExceptionType.receiveTimeout:
              errorContent = AppStr.errorConnectTimeOut.tr;
              break;
            case DioExceptionType.cancel:
              // không hiện thông báo khi huỷ request
              errorContent = '';
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                // Mã lỗi sai khi check taxcode đơn vị chưa được sử dụng
                case 302:
                  errorContent = AppStr.error302.tr;
                  break;
                case AppConst.error400:
                  errorContent = AppStr.error400.tr;
                  break;
                case AppConst.error401:
                  errorContent = AppStr.error401.tr;
                  break;
                case AppConst.error404:
                  errorContent = AppStr.error404.tr;
                  break;
                case AppConst.error500:
                  errorContent = AppStr.errorInternalServer.tr;
                  break;
                case AppConst.error502:
                  errorContent = AppStr.error502.tr;
                  break;
                case AppConst.error503:
                  errorContent = AppStr.error503.tr;
                  break;
                default:
                  errorContent = AppStr.errorInternalServer.tr;
              }
              break;
            default:
              errorContent = AppStr.errorConnectFailedStr.tr;
          }
          // check lỗi khi tải pdf
          if (error.response?.data != null &&
              error.response?.data is List<int>) {
            var result = utf8.decode(error.response?.data);
            var err = jsonDecode(result);
            if (err is Map) {
              errorContent = err['Message'];
            }
          }
        }
      }

      isShowLoading.value = false;
      isLoadingOverlay.value = false;
      if (errorContent.isNotEmpty) {
        ShowPopup.showErrorMessage(
          errorContent,
          errorFix: errorFix,
        );
      }
    });
  }

  Future<void> showSnackBar<T>(
    String message, {
    Duration duration = const Duration(seconds: 2),
    Widget? mainButton,
    Color backgroundColor = AppColors.darkAccentColor,
  }) async {
    BotToast.showCustomText(
      duration: message.length > 100 ? 5.seconds : duration,
      align: Alignment.topCenter,
      toastBuilder: (cancel) {
        return Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(AppDimens.defaultPadding),
            margin: const EdgeInsets.all(AppDimens.defaultPadding),
            decoration: BoxDecoration(
              color: AppColors.snackbarBgColor,
              border: Border.all(
                color: AppColors.grayLight6,
              ),
              borderRadius: BorderRadius.circular(AppDimens.radius8),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 4),
                  blurRadius: 8.1,
                  color: Colors.black.withOpacity(0.15),
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: UtilWidgets.buildText(
                    message,
                    textColor: AppColors.snackbarTextColor,
                    textAlign: TextAlign.start,
                    maxLine: 3,
                  ),
                ),
                if (mainButton != null) mainButton,
                InkWell(
                  onTap: cancel,
                  child: SvgPicture.asset(
                    Assets.ASSETS_ICONS_IC_CLOSE_SNACKBAR_SVG,
                    width: AppDimens.sizeIconSmall,
                    height: AppDimens.sizeIconSmall,
                  ).paddingOnly(left: AppDimens.defaultPadding),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void addCancelToken(CancelToken cancelToken) {
    cancelTokens.add(cancelToken);
  }

  void cancelRequest(CancelToken cancelToken) {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel('Cancel when close controller!!!');
    }
  }

  void changeTheme() {
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.light : ThemeMode.dark);

    isDarkMode.toggle();
    APP_DATA.write(AppConst.keyIsDarkTheme, isDarkMode.value);

    if (GetPlatform.isIOS) {
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.textColorWhite,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      );
    }

    Get.forceAppUpdate();
  }

  void changeLang() {
    isLanguageVN.toggle();
    APP_DATA.write(AppConst.keyLanguageIsVN, isLanguageVN.value);
  }

  @override
  void onClose() {
    for (final cancelToken in cancelTokens) {
      cancelRequest(cancelToken);
    }
    super.onClose();
  }

  @override
  void onReady() {
    _setOnErrorListener();
    super.onReady();
  }

  ResponseError? getErrorMessage(int? errorCode) {
    if (errorCode == null) return null;
    return responseErrors[errorCode];
  }
}
