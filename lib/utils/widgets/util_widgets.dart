import 'dart:async';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:do_an_application/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_spinbox_fork/flutter_spinbox.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_custom.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../assets.dart';
import '../../base/base.dart';
import '../../const/colors.dart';
import '../../const/const.dart';
import '../../const/dimens.dart';
import '../../const/enum/input_formatter_enum.dart';
import '../../const/style.dart';
import '../utils.dart';

class UtilWidgets {
  static DateTime? _dateTime;
  static int _oldFunc = 0;
  static const throttleDuration = Duration(seconds: 2);

  static const Widget sizedBoxEmpty = SizedBox.shrink();
  static const Widget sizedBox5 = SizedBox(height: 5);
  static const Widget sizedBox8 = SizedBox(height: 8);
  static const Widget sizedBox10 = SizedBox(height: 10);
  static const Widget sizedBox12 = SizedBox(height: 12);
  static const Widget sizedBox16 = SizedBox(height: 16);
  static const Widget sizedBox20 = SizedBox(height: 20);
  static const Widget sizedBox24 = SizedBox(height: 24);
  static const Widget sizedBoxWidth20 = SizedBox(width: 20);
  static const Widget sizedBoxWidth8 = SizedBox(width: 8);
  static const Widget sizedBoxWidth10 = SizedBox(width: 10);
  static const Widget sizedBoxWidth16 = SizedBox(width: 16);
  static const Widget sizedBoxPaddingHuge =
      SizedBox(height: AppDimens.paddingHuge);
  static const Widget sizedBoxPadding =
      SizedBox(height: AppDimens.defaultPadding);

  static Widget buildSafeArea(Widget childWidget,
      {double miniumBottom = 12, Color? color}) {
    return Container(
      color: color ?? AppColors.scaffoldBackgroundColor,
      child: SafeArea(
        bottom: true,
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.only(bottom: miniumBottom),
        child: childWidget,
      ),
    );
  }

  static Widget buildLogo(String imgLogo, double height) {
    return SizedBox(
      height: height,
      child: Image.asset(imgLogo),
    );
  }

  static const Widget buildLoading = CupertinoActivityIndicator();

  static PreferredSizeWidget buildAppBar({
    String? title,
    Widget? leading,
    List<Widget>? actions,
    double? leadingWidth,
    Widget? titleWidget,
    SystemUiOverlayStyle? systemOverlayStyle,
  }) {
    assert(title != null || titleWidget != null, 'Title is required');
    return AppBar(
      systemOverlayStyle: systemOverlayStyle ??
          SystemUiOverlayStyle(statusBarColor: AppColors.appBarBackgroundColor),
      scrolledUnderElevation: 0, // Prevent change color when scrolling
      backgroundColor: AppColors.appBarBackgroundColor,
      title: titleWidget ?? buildAppBarTitle(title ?? ''),
      centerTitle: true,
      leading: leading,
      leadingWidth: leadingWidth,
      actions: actions,
    );
  }

  static Widget buildAppBarTitle(
    String title, {
    bool? textAlignCenter,
    Color? textColor,
  }) {
    textAlignCenter = textAlignCenter ?? GetPlatform.isAndroid;
    return AutoSizeText(
      title,
      textAlign: textAlignCenter ? TextAlign.center : TextAlign.left,
      style: AppTextStyle.font20Semi.copyWith(
        color: textColor ?? AppColors.gray1,
      ),
      maxLines: 2,
    );
  }

  static Widget buildTitle(String title) {
    return Text(
      title,
      style: AppStyle.textTitleWhiteStyle
          .copyWith(color: AppColors.hintTextColor()),
      textAlign: TextAlign.center,
    );
  }

  static Widget buildButton(String btnTitle, Function function,
      {List<Color> colors = AppColors.colorGradientOrange,
      bool isLoading = false,
      bool showLoading = true}) {
    return Container(
      width: double.infinity,
      height: AppDimens.btnMedium,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(8)),
      child: UtilWidgets.baseOnAction(
        onTap: !isLoading ? function : () {},
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
          ),
          child: Stack(
            children: [
              Center(
                child: Text(btnTitle,
                    style: TextStyle(
                        fontSize: AppDimens.fontMedium(), color: Colors.white)),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Visibility(
                  visible: isLoading && showLoading,
                  child: const SizedBox(
                    height: AppDimens.btnSmall,
                    width: AppDimens.btnSmall,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.colorError,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget buildGradientText(Text textWidget,
      {LinearGradient linearGradient = const LinearGradient(
          colors: AppColors.colorGradientBlue,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight)}) {
    // gradient chỉ hiển thị khi text màu trắng
    textWidget.style?.copyWith(color: Colors.white);
    return ShaderMask(
        shaderCallback: (bounds) => linearGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
        child: textWidget);
  }

  static Widget buildSmartRefresherCustomFooter() {
    return CustomFooter(
      builder: (context, mode) {
        if (mode == LoadStatus.loading) {
          return const CupertinoActivityIndicator();
        } else {
          return const Opacity(
            opacity: 0.0,
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }

  static Widget buildDivider({
    double height = 1.0,
    double thickness = 1.0,
    double indent = 0.0,
    Color? color,
  }) {
    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: indent,
      color: color ?? AppColors.gray7,
    );
  }

  static Widget IncrementAndDecrement({
    var onLongPressStart,
    var onLongPressEnd,
    var onTap,
    IconData? icon,
    Color? color,
    Color? iconColor,
  }) {
    return GestureDetector(
      onLongPressStart: (_) {
        onLongPressStart();
      },
      onLongPressEnd: (_) {
        onLongPressEnd();
      },
      onTap: () {
        onTap();
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color ?? AppColors.primary2,
          border: Border.all(color: AppColors.primary2),
        ),
        child: Icon(
          icon,
          color: iconColor ?? AppColors.colorWhite,
        ),
      ),
    );
  }

  // static Widget buildChipVAT({
  //   required int? vatRate,
  //   ValueChanged<int>? onChanged,
  // }) {
  //   return buildCardBase(
  //     SizedBox(
  //       width: double.infinity,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           UtilWidgets.buildText(
  //             ' LocaleKeys.productDetail_productDetailVAT.tr',
  //             style: AppTextStyle.font14Semi.copyWith(
  //               color: AppColors.gray4,
  //             ),
  //           ).paddingOnly(bottom: AppDimens.paddingSmall),
  //           Wrap(
  //             alignment: WrapAlignment.start,
  //             spacing: AppDimens.paddingVerySmall,
  //             runSpacing: AppDimens.paddingVerySmall,
  //             children: VatRateEnum.values.map((element) {
  //               return UtilWidgets.buildChoiceChip(
  //                 title: element.title,
  //                 isSelected: element.vat == vatRate,
  //                 onChanged: (_) {
  //                   onChanged?.call(element.vat);
  //                 },
  //               );
  //             }).toList(),
  //           ),
  //         ],
  //       ).paddingAll(AppDimens.defaultPadding),
  //     ),
  //   );
  // }

  static Widget buildEmptyFilter({
    required VoidCallback onRefresh,
    required VoidCallback removeFilter,
    required Map<String, String> emptyStrs,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UtilWidgets.buildText(
            LocaleKeys.app_dataEmptyWhen.tr,
            style: AppTextStyle.font20Semi.copyWith(
              color: AppColors.gray1,
            ),
          ),
          sizedBox8,
          ...emptyStrs.entries
              .where((entry) => entry.key.isNotEmpty && entry.value.isNotEmpty)
              .map(
            (e) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: UtilWidgets.buildText(
                      "${e.key}:",
                      textAlign: TextAlign.end,
                      style: AppTextStyle.font14Re.copyWith(
                        color: AppColors.gray2,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppDimens.paddingVerySmall),
                  Expanded(
                    child: UtilWidgets.buildText(
                      e.value,
                      textAlign: TextAlign.start,
                      style: AppTextStyle.font14Bo.copyWith(
                        color: AppColors.gray1,
                      ),
                      maxLine: 3,
                    ),
                  ),
                ],
              ).paddingSymmetric(vertical: AppDimens.padding6);
            },
          ),
          sizedBox16,
          Row(
            children: [
              Expanded(
                child: UtilWidgets.buildSolidButtonBack(
                  title: 'LocaleKeys.filter_removeFilter.tr',
                  onPressed: removeFilter,
                ),
              ),
              const SizedBox(width: AppDimens.defaultPadding),
              Expanded(
                child: UtilWidgets.buildSolidButton(
                  title: 'LocaleKeys.app_refresh.tr',
                  onPressed: onRefresh,
                ),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
    );
  }

  static Widget buildEmpty({required Function onRefresh, String? emptyStr}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: UtilWidgets.buildText(
            emptyStr ?? LocaleKeys.app_dataEmpty.tr,
            style: AppTextStyle.font16Semi,
          ),
        ),
        baseOnAction(
          onTap: onRefresh,
          child: const IconButton(
            icon: Icon(
              Icons.refresh,
              size: AppDimens.sizeIconMedium,
            ),
            onPressed: null,
          ),
        ),
      ],
    );
  }

  static Widget buildListAndBtn({required Widget child, Widget? buildBtn}) {
    return Column(
      children: [
        Expanded(
          child: child,
        ),
        Visibility(visible: buildBtn != null, child: buildBtn ?? Container())
      ],
    );
  }

  /// Widget cài đặt việc refresh page
  static Widget buildSmartRefresher({
    required RefreshController refreshController,
    required Widget child,
    ScrollController? scrollController,
    Function()? onRefresh,
    Function()? onLoadMore,
    bool enablePullUp = false,
  }) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: enablePullUp,
      scrollController: scrollController,
      header: const MaterialClassicHeader(),
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      footer: UtilWidgets.buildSmartRefresherCustomFooter(),
      child: child,
    );
  }

  static Widget buildShimmerLoading() {
    const padding = AppDimens.defaultPadding;
    final shimmerBaseColor = AppColors.shimmerBaseColor;
    final shimmerHighlightColor = AppColors.shimmerHighlightColor;
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Shimmer.fromColors(
                    baseColor: shimmerBaseColor,
                    highlightColor: shimmerHighlightColor,
                    enabled: true,
                    child: Container(
                      width: double.infinity,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: shimmerBaseColor,
                        borderRadius: BorderRadius.circular(AppDimens.radius8),
                      ),
                    ),
                  ),
                  sizedBox10,
                  Row(
                    children: [
                      Expanded(
                        child: Shimmer.fromColors(
                          baseColor: shimmerBaseColor,
                          highlightColor: shimmerHighlightColor,
                          enabled: true,
                          child: Container(
                            height: 16.0,
                            decoration: BoxDecoration(
                              color: shimmerBaseColor,
                              borderRadius:
                                  BorderRadius.circular(AppDimens.radius8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Shimmer.fromColors(
                          baseColor: shimmerBaseColor,
                          highlightColor: shimmerHighlightColor,
                          enabled: true,
                          child: Container(
                            height: 16.0,
                            decoration: BoxDecoration(
                              color: shimmerBaseColor,
                              borderRadius:
                                  BorderRadius.circular(AppDimens.radius8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              separatorBuilder: (context, index) => buildDivider(
                color: shimmerBaseColor,
              ).paddingSymmetric(
                vertical: AppDimens.paddingSmall,
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  static List<TextSpan> highlightText(
      String source, String query, Color colorHighlight) {
    if (query.isEmpty) {
      return [TextSpan(text: source)];
    }

    var matches = <Match>[];
    for (final token in query.trim().toLowerCase().split(' ')) {
      matches.addAll(token.allMatches(source.toLowerCase()));
    }

    if (matches.isEmpty) {
      return [TextSpan(text: source)];
    }
    matches.sort((a, b) => a.start.compareTo(b.start));

    int lastMatchEnd = 0;
    final List<TextSpan> children = [];
    for (final match in matches) {
      if (match.end <= lastMatchEnd) {
      } else if (match.start <= lastMatchEnd) {
        children.add(
          TextSpan(
            text: source.substring(lastMatchEnd, match.end),
            style: Get.textTheme.bodyMedium!.copyWith(
              color: AppColors.textColor(),
              backgroundColor: colorHighlight,
            ),
          ),
        );
      } else if (match.start > lastMatchEnd) {
        children.add(
          TextSpan(
            text: source.substring(lastMatchEnd, match.start),
          ),
        );

        children.add(
          TextSpan(
            text: source.substring(match.start, match.end),
            style: Get.textTheme.bodyMedium!.copyWith(
              color: AppColors.textColor(),
              backgroundColor: colorHighlight,
            ),
          ),
        );
      }

      if (lastMatchEnd < match.end) {
        lastMatchEnd = match.end;
      }
    }

    if (lastMatchEnd < source.length) {
      children.add(
        TextSpan(
          text: source.substring(lastMatchEnd, source.length),
        ),
      );
    }

    return children;
  }

  static List<TextSpan> textImportantStrings({
    required String source,
    required String textImportants,
  }) {
    // Thêm , vào cuối để tìm đúng số cần highlight
    int start = source.indexOf("$textImportants,");
    int end = start + textImportants.length;

    return [
      TextSpan(text: source.substring(0, start)),
      TextSpan(
        text: source.substring(start, end),
        style: AppTextStyle.font16Bo.copyWith(color: AppColors.primary2),
      ),
      TextSpan(text: source.substring(end)),
    ];
  }

  static Widget buildBottomSheet({
    required String title,
    required Widget body,
    Widget? iconTitle,
    bool isSecondDisplay = false,
    // double? height,
  }) {
    return SafeArea(
      bottom: false,
      minimum: EdgeInsets.only(
          top: Get.mediaQuery.padding.top + (isSecondDisplay ? 100 : 20)),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bottomSheetBgColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(AppDimens.radius30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildBottomHeader(),
            UtilWidgets.buildText(
              title,
              textAlign: iconTitle == null ? TextAlign.center : TextAlign.left,
              maxLine: 1,
              style: AppTextStyle.font18Ex.copyWith(color: AppColors.gray1),
            ).paddingOnly(
              bottom: iconTitle == null ? AppDimens.padding24 : 0,
            ),
            iconTitle ??
                const SizedBox(
                  width: kToolbarHeight,
                ),
            Expanded(child: body),
          ],
        ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
      ),
    );
  }

  static Widget buildButtonIcon({
    required IconData icons,
    required Function func,
    required Color colors,
    required String title,
    double sizeIcon = 20,
    double radius = 30,
    double padding = 8.0,
    Color? textColor,
    Color? iconColor = AppColors.hintTextSolidColor,
    String? imgAsset,
  }) =>
      UtilWidgets.baseOnAction(
        onTap: func,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: colors,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: imgAsset != null
                  ? Image.asset(
                      imgAsset,
                      fit: BoxFit.cover,
                      height: sizeIcon,
                      width: sizeIcon,
                    )
                  : Icon(
                      icons,
                      color: iconColor,
                      size: sizeIcon,
                    ),
            ),
            if (title.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                title,
                style: Get.theme.textTheme.titleSmall!.copyWith(
                    color: textColor ?? AppColors.textColor(), fontSize: 12),
              ),
            ]
          ],
        ),
      );

  static Widget buildButtonIconGradient({
    required String title,
    required IconData iconData,
    required Function function,
    required List<Color> colorGradient,
    bool isValueNull = false,
  }) =>
      UtilWidgets.baseOnAction(
        onTap: function,
        child: Column(children: [
          Container(
            width: AppDimens.sizeIconLarge,
            height: AppDimens.sizeIconLarge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors:
                    !isValueNull ? colorGradient : AppColors.colorGradientGray,
              ),
            ),
            child: Icon(iconData),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: Get.textTheme.titleSmall!.copyWith(
                fontSize: AppDimens.fontSmallest(), color: Colors.white54),
          )
        ]),
      );

  static Widget buildCardBase(
    Widget child, {
    Color? colorBorder,
    Color? backgroundColor,
    double? radius,
    double? height,
    BorderRadiusGeometry? borderRadius,
    double minHeight = 0,
  }) =>
      Container(
        constraints: BoxConstraints(
          minHeight: minHeight,
        ),
        height: height,
        width: Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.cardBackgroundColor(),
            borderRadius:
                borderRadius ?? BorderRadius.all(Radius.circular(radius ?? 8)),
            border: Border.all(
              color: colorBorder ?? Colors.white,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                blurRadius: 3,
              ),
            ]),
        child: child,
      );

  static Widget buildCardShadow(Widget child,
          {Color? colorBorder,
          Color? backgroundColor,
          BorderRadiusGeometry? borderRadius}) =>
      Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.cardBackgroundColor(),
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: colorBorder ?? Colors.transparent.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: child);

  static Widget buildTitleInfo({required String title, String? info}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                Get.textTheme.titleMedium!.copyWith(color: AppColors.titleText),
          ),
          Text('${info?.trim()}', style: Get.textTheme.bodyLarge)
              .paddingSymmetric(vertical: AppDimens.paddingVerySmall),
          buildDivider(height: 1)
        ],
      ).paddingOnly(bottom: AppDimens.paddingVerySmall);

  /// Sử dụng để tránh trường hợp click liên tiếp khi thực hiện function
  static Widget baseOnAction({
    required Function onTap,
    required Widget child,
  }) {
    return GestureDetector(
      onTap: () {
        DateTime now = DateTime.now();
        if (_dateTime == null ||
            now.difference(_dateTime ?? DateTime.now()) > throttleDuration ||
            onTap.hashCode != _oldFunc) {
          _dateTime = now;
          _oldFunc = onTap.hashCode;
          onTap();
        }
      },
      child: child,
    );
  }

  static Future<DateTime?> buildDateTimePicker({
    required DateTime dateTimeInit,
    DateTime? minTime,
    DateTime? maxTime,
  }) async {
    DateTime? newDateTime = await showRoundedDatePicker(
      context: Get.context!,
      height: Get.height / 1.8,
      initialDate: dateTimeInit,
      firstDate: minTime ?? DateTime.utc(DateTime.now().year - 10),
      lastDate: maxTime,
      // barrierDismissible: true,
      theme: ThemeData(
        primaryColor: AppColors.bottomSheetBgColor,
        dialogBackgroundColor: AppColors.bottomSheetBgColor,
        disabledColor: AppColors.hintTextColor(),
        textTheme: TextTheme(
          bodySmall: AppTextStyle.font14Semi
              .copyWith(color: AppColors.hintTextColor()),
          bodyMedium: AppTextStyle.font16Bo,
        ),
      ),
      styleDatePicker: MaterialRoundedDatePickerStyle(
        textStyleMonthYearHeader: AppTextStyle.font16Bo,
        colorArrowNext: AppColors.hintTextColor(),
        colorArrowPrevious: AppColors.hintTextColor(),
        textStyleButtonNegative:
            AppTextStyle.font16Bo.copyWith(color: AppColors.hintTextColor()),
        textStyleButtonPositive:
            AppTextStyle.font16Bo.copyWith(color: AppColors.primary2),
        decorationDateSelected: BoxDecoration(
          color: AppColors.primary2,
          shape: BoxShape.circle,
        ),
        textStyleCurrentDayOnCalendar: AppTextStyle.font16Bo.copyWith(
          color: AppColors.primary2,
        ),
        textStyleYearButton: AppTextStyle.font16Bo,
        textStyleDayButton: AppTextStyle.font16Bo,
      ),
    );
    return newDateTime;
  }

  static Widget buildItemShowBottomSheet({
    required IconData icon,
    required String title,
    required Function function,
    required Color backgroundIcons,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundIcons,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          icon,
          size: 20,
          color: Colors.white,
        ),
      ).marginOnly(left: 5),
      contentPadding: const EdgeInsets.all(8),
      title: Text(title,
          style: Get.textTheme.titleMedium!
              .copyWith(color: AppColors.textColor())),
      onTap: () {
        Get.back();
        function();
      },
    );
  }

  // Show case
  static Widget buildBlur({double blur = 3.0}) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: blur,
        sigmaY: blur,
      ),
      child: Container(color: Colors.transparent),
    );
  }

  static Widget buildTouchApp({IconData iconData = Icons.touch_app}) {
    return Icon(
      iconData,
      size: AppDimens.sizeIconLarge,
      color: AppColors.textColor(),
    );
  }

  static Widget buildAnimationShowCaseHeadShake(Widget child,
      {Duration? duration}) {
    return HeadShake(
      preferences: AnimationPreferences(
          autoPlay: AnimationPlayStates.Loop, duration: duration ?? 1.seconds),
      child: child,
    );
  }

  static Widget buildAnimationShowCaseHeartBeat(Widget child) {
    return HeartBeat(
      preferences:
          const AnimationPreferences(autoPlay: AnimationPlayStates.Loop),
      child: child,
    );
  }

  static Widget buildAnimationShowCaseSlideSlideOutLeft(Widget child) {
    return SlideOutLeft(
      preferences: AnimationPreferences(
        autoPlay: AnimationPlayStates.Loop,
        duration: 10.seconds,
      ),
      child: child,
    );
  }

  static Widget buildMainButtonPhone() {
    return UtilWidgets.baseOnAction(
      onTap: () async {
        if (await canLaunchUrlString(AppConst.telSupportNumber)) {
          await launchUrlString(AppConst.telSupportNumber);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(AppDimens.paddingVerySmall),
        decoration: BoxDecoration(
          color: AppColors.appBarColor(),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(
          Icons.phone,
          color: AppColors.colorBlueAccent,
          size: 20,
        ),
      ).paddingOnly(right: AppDimens.paddingVerySmall),
    );
  }

//chờ có ảnh không có thông báo để sử dụng dùng tạm icon
  static Widget buildImgError() {
    return Image.asset(Assets.ASSETS_IMAGES_EMPTY_FOLDER_PNG);
  }

//chờ có ảnh mất kết nối để thay thế tạm dùng icon
  static Widget buildImgLostConnect() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.perm_data_setting_rounded,
            size: AppDimens.sizeIconExtraLarge,
            color: AppColors.hintTextColor(),
          ),
          const SizedBox(
            height: 30,
          ),
          Text('LocaleKeys.dashboard_dashboardCannotConnect.tr',
              style: Get.textTheme.bodyMedium)
        ],
      ),
    );
  }

  static Widget buildEmptyIcon(
    IconData icon,
    String title,
  ) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: AppDimens.sizeIconExtraLarge,
            color: AppColors.iconEmpty(),
          ),
          Container(
            alignment: Alignment.center,
            child: UtilWidgets.buildText(
              title,
              style: AppTextStyle.font16Semi,
            ).paddingSymmetric(vertical: AppDimens.paddingSmall),
          ),
        ],
      ),
    );
  }

  // static Widget buildChangLanguage({
  //   required LoginController loginController,
  // }) =>
  //     Align(
  //       alignment: Alignment.centerRight,
  //       child: GestureDetector(
  //         onTap: () {
  //           loginController.changeLang();
  //           changLanguage();
  //         },
  //         child: Container(
  //           width: 50,
  //           height: 25,
  //           decoration: const BoxDecoration(
  //               color: Colors.white38,
  //               borderRadius: BorderRadius.all(Radius.circular(20))),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 loginController.isLanguageVN.value
  //                     ? LocaleKeys.login_vie.tr
  //                     : LocaleKeys.login_eng.tr,
  //                 style: Get.textTheme.titleSmall!
  //                     .copyWith(color: AppColors.textColorWhite),
  //               ).paddingOnly(left: AppDimens.paddingVerySmall),
  //               CircleAvatar(
  //                 backgroundImage: AssetImage(loginController.isLanguageVN.value
  //                     ? Assets.ASSETS_ICONS_VIETNAM_FLAG_PNG
  //                     : Assets.ASSETS_ICONS_ENGLAND_FLAG_JPG),
  //                 radius: 10,
  //               ).paddingOnly(right: 3)
  //             ],
  //           ),
  //         ),
  //       ).paddingOnly(right: AppDimens.paddingVerySmall),
  // );

  static Widget buildSwitch({
    required String title,
    required RxBool val,
    required Function(bool)? func,
    String? desc,
    Widget? trailing,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UtilWidgets.buildCardBase(
          ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius8),
              ),
              title: buildText(
                title,
                style: AppTextStyle.font14Bo.copyWith(
                  color: AppColors.gray1,
                ),
                textAlign: TextAlign.start,
              ),
              trailing: trailing ??
                  Obx(
                    () => CupertinoSwitch(
                      value: val.value,
                      onChanged: func,
                      activeColor: AppColors.primary2,
                    ),
                  ),
              onTap: () {
                // func();
              }),
          backgroundColor: AppColors.cardBackgroundColor(),
          radius: AppDimens.radius8,
        ),
        if (desc != null)
          buildText(
            desc,
            style: AppTextStyle.font12Re.copyWith(
              color: AppColors.gray3,
            ),
            maxLine: 5,
            textAlign: TextAlign.start,
          ).paddingOnly(top: AppDimens.paddingVerySmall),
      ],
    );
  }

  /// If style not null, color, fontWeight, overflow, fontSize will be ignored
  static Widget buildText(
    String text, {
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color? textColor,
    int? maxLine,
    double? fontSize,
    TextStyle? style,
    double minFontSize = 12,
    TextOverflow? overflow,
  }) {
    return AutoSizeText(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: style ??
          AppTextStyle.font12Re.copyWith(
            color: textColor ?? AppColors.textColorDefault,
            fontWeight: fontWeight,
            overflow: overflow ?? TextOverflow.ellipsis,
            fontSize: fontSize ?? AppDimens.fontSmall(),
          ),
      maxLines: maxLine ?? 1,
      minFontSize: minFontSize,
    );
  }

  static Widget buildInputNumber({
    required TextEditingController textEditingController,
    required FocusNode focusNode,
    required ValueNotifier<TextEditingController> notifier,
    RxBool? isVisibleBtn,
    TextStyle? textStyle,
    bool isRequire = false,
  }) {
    final textFieldFocusNode = FocusNode();
    return Focus(
      onFocusChange: (hasFocus) {
        isVisibleBtn?.refresh();
        final bottom = View.of(Get.context!).viewInsets.bottom;
        final mainFocusNode = Get.focusScope!;

        if (mainFocusNode.hasFocus && bottom > 0) {
          mainFocusNode.unfocus();

          Timer(const Duration(milliseconds: 100), () {
            focusNode.requestFocus();
          });
        }

        textFieldFocusNode.addListener(() {
          isVisibleBtn?.value = !(textFieldFocusNode.hasFocus);
        });
      },
      child: KeyboardCustomInput<TextEditingController>(
        focusNode: focusNode,
        notifier: notifier,
        builder: (context, val, hasFocus) {
          textEditingController = val;
          if (hasFocus ?? false) textFieldFocusNode.requestFocus();
          return TextFormField(
            focusNode: textFieldFocusNode,
            controller: textEditingController,
            textAlign: TextAlign.left,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: textStyle ??
                AppTextStyle.font14Re.copyWith(
                  color: AppColors.textColor(),
                ),
            validator: (val) {
              if (isRequire && val.isStringEmpty) {
                return 'LocaleKeys.invoiceCreation_vatRateOtherCannotEmpty.tr';
              }
              return null;
            },
            showCursor: true,
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'LocaleKeys.invoiceCreation_inputTax.tr',
              hintStyle: AppTextStyle.font14Re.copyWith(
                color: AppColors.textFieldHintColor,
              ),
              errorStyle: TextStyle(
                color: AppColors.errorText(),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius6),
                borderSide: BorderSide(color: AppColors.primary2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius6),
                borderSide: BorderSide(
                  color: AppColors.gray7,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius6),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius6),
                borderSide: const BorderSide(color: Colors.red),
              ),
              fillColor: AppColors.textFieldFillColor,
              filled: true,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(AppDimens.paddingSmall),
            ),
            onTap: () {
              textEditingController.selection = TextSelection.fromPosition(
                TextPosition(offset: textEditingController.text.length),
              );
            },
          );
        },
      ),
    );
  }

  static Widget buildCheckBox({
    required bool value,
    required void Function(bool)? onChanged,
  }) {
    return InkWell(
      onTap: () {
        onChanged?.call(!value);
      },
      child: SvgPicture.asset(
        value
            ? Assets.ASSETS_ICONS_CHECK_BOX_SELECTED_SVG
            : Assets.ASSETS_ICONS_CHECK_BOX_UNSELECTED_SVG,
      ),
    );
  }

  static Widget buildSolidButton({
    required String title,
    VoidCallback? onPressed,
    double? width,
    double? height,
    bool isLoading = false,
    bool showShadow = false,
  }) {
    return Container(
      width: width,
      height: height ?? AppDimens.btnDefaultFigma,
      decoration: BoxDecoration(
        boxShadow: !showShadow
            ? null
            : [
                BoxShadow(
                  color: AppColors.colorConfirm.withOpacity(0.3),
                  blurRadius: 23.3,
                  offset: const Offset(1, 1),
                ),
              ],
      ),
      child: ElevatedButton(
        onPressed: () {
          DateTime now = DateTime.now();
          if (_dateTime == null ||
              now.difference(_dateTime ?? DateTime.now()) > throttleDuration ||
              onPressed.hashCode != _oldFunc) {
            _dateTime = now;
            _oldFunc = onPressed.hashCode;
            onPressed?.call();
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          backgroundColor: AppColors.primary2,
          padding: const EdgeInsets.all(AppDimens.paddingVerySmall),
        ),
        child: Stack(
          children: [
            Center(
              child: UtilWidgets.buildText(
                title,
                style: AppTextStyle.font14Semi.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Visibility(
                visible: isLoading,
                child: const SizedBox(
                  height: AppDimens.btnSmall,
                  width: AppDimens.btnSmall,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.colorError,
                    ),
                  ),
                ),
              ).paddingOnly(right: AppDimens.paddingVerySmall),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildSolidButtonBack({
    required String title,
    String? secondTitle,
    VoidCallback? onPressed,
    double? width,
    double? height,
    Color? disableTextColor,
  }) {
    return SizedBox(
      width: width,
      height: height ?? AppDimens.btnDefaultFigma,
      child: OutlinedButton(
        onPressed: () {
          DateTime now = DateTime.now();
          if (_dateTime == null ||
              now.difference(_dateTime ?? DateTime.now()) > throttleDuration ||
              onPressed.hashCode != _oldFunc) {
            _dateTime = now;
            _oldFunc = onPressed.hashCode;
            onPressed?.call();
          }
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius6),
          ),
          side: BorderSide(
            color: onPressed != null ? AppColors.primary2 : AppColors.gray7,
          ),
          backgroundColor:
              onPressed != null ? AppColors.colorButtonLeft : AppColors.gray7,
        ),
        child: FittedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UtilWidgets.buildText(
                title,
                style: AppTextStyle.font14Semi.copyWith(
                  color: onPressed != null
                      ? AppColors.primary2
                      : disableTextColor ?? AppColors.grayLight6,
                ),
                textAlign: TextAlign.center,
              ),
              if (secondTitle != null)
                UtilWidgets.buildText(
                  secondTitle,
                  style: AppTextStyle.font14Semi.copyWith(
                    color: onPressed != null
                        ? AppColors.primary2
                        : AppColors.gray4,
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ).paddingSymmetric(vertical: AppDimens.paddingSmallest),
        ),
      ),
    );
  }

  static Widget buildDropdown<T>({
    required List<T> items,
    required String Function(T) display,
    T? selectedItem,
    ValueChanged<T?>? onChanged,
    double height = 50,
    String? hintText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundInput,
        borderRadius:
            const BorderRadius.all(Radius.circular(AppDimens.radius8)),
        border: Border.all(color: AppColors.gray7),
      ),
      child: DropdownButtonHideUnderlineCustom(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.defaultPadding,
          ),
          child: DropdownButtonCustom<T>(
            dropdownColor: AppColors.dropDownBgColor,
            isExpanded: true,
            items: items
                .map(
                  (e) => DropdownMenuItemCustom<T>(
                    value: e,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppDimens.paddingVerySmall),
                      child: buildText(
                        display(e),
                        style: selectedItem == e
                            ? AppTextStyle.font14Bo
                            : AppTextStyle.font14Re,
                        maxLine: 2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                )
                .toList(),
            value: selectedItem,
            onChanged: onChanged,
            hint: hintText != null
                ? buildText(
                    hintText,
                    style: AppTextStyle.font14Re,
                    maxLine: 2,
                    textAlign: TextAlign.start,
                  )
                : null,
          ),
        ),
      ),
    );
  }

  static Widget buildDropdownExtra<T>({
    required List<T> items,
    required String Function(T) display,
    T? selectedItem,
    ValueChanged<T?>? onChanged,
    VoidCallback? onDelete,
    double height = 50,
    String? hintText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundInput,
        borderRadius:
            const BorderRadius.all(Radius.circular(AppDimens.radius8)),
        border: Border.all(color: AppColors.gray7),
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
        child: Row(
          children: [
            // dropdown chiếm hết phần còn lại
            Expanded(
              child: DropdownButtonHideUnderlineCustom(
                child: DropdownButtonCustom<T>(
                  dropdownColor: AppColors.dropDownBgColor,
                  isExpanded: true,
                  items: items
                      .map(
                        (e) => DropdownMenuItemCustom<T>(
                          value: e,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppDimens.paddingVerySmall),
                            child: buildText(
                              display(e),
                              style: selectedItem == e
                                  ? AppTextStyle.font14Bo
                                  : AppTextStyle.font14Re,
                              maxLine: 2,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  value: selectedItem,
                  onChanged: onChanged,
                  hint: hintText != null
                      ? buildText(
                          hintText,
                          style: AppTextStyle.font14Re,
                          maxLine: 2,
                          textAlign: TextAlign.start,
                        )
                      : null,
                  icon: selectedItem == null
                      ? const Icon(Icons.arrow_drop_down)
                      : GestureDetector(
                          onTap: onDelete,
                          child: const Icon(Icons.clear),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildChoiceChip({
    required String title,
    required bool isSelected,
    void Function(bool)? onChanged,
  }) {
    return ChoiceChip(
      // Sau khi nâng flutter lên 3.24.5 thì nếu sử dụng AutoSizeText làm label của ChoiceChip thì sẽ bị lỗi UI
      // => Chuyển về sử dụng Text
      label: Text(
        title,
        style: AppTextStyle.font14Semi.copyWith(
          color:
              isSelected ? AppColors.choiceSelectedColor : AppColors.grayLight3,
        ),
      ),
      selected: isSelected,
      onSelected: onChanged,
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.paddingVerySmall,
        horizontal: AppDimens.paddingSmall,
      ),
      selectedColor: AppColors.choiceChipSelectedColor,
      backgroundColor: AppColors.choiceChipBackgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected ? AppColors.primary2 : AppColors.gray7,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      showCheckmark: false,
    );
  }

  static Widget buildBottomSheetFigma({
    required Widget child,
  }) {
    return Container(
      padding: EdgeInsets.only(
        left: AppDimens.defaultPadding,
        right: AppDimens.defaultPadding,
        bottom: GetPlatform.isAndroid ? AppDimens.paddingVerySmall : 0.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.bottomSheetBgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppDimens.radius30),
          topRight: Radius.circular(AppDimens.radius30),
        ),
      ),
      child: Container(
        constraints: BoxConstraints(maxHeight: Get.height * 0.8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildBottomHeader(),
            child,
          ],
        ),
      ),
    );
  }

  static Widget buildBottomSheetInvoiceExtend({
    Function(String, String)? onSubmit,
  }) {
    final inputNumberController = TextEditingController();
    final inputPhoneController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bottomSheetBgColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(
            AppDimens.radius30,
          ),
        ),
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildBottomHeader(),
            UtilWidgets.buildText(
              'LocaleKeys.searchInvoice_hintInvoiceExtendCurrentNumber_1.tr',
              style: AppTextStyle.font16Bo,
              textAlign: TextAlign.start,
              maxLine: 10,
            ).paddingOnly(
              bottom: AppDimens.paddingSmall,
            ),
            BuildInputText(InputTextModel(
              iconLeading: Icons.timeline,
              textInputType: TextInputType.number,
              controller: inputNumberController,
              inputFormatters: 4,
              maxLengthInputForm: 20,
              hintText: 'LocaleKeys.searchInvoice_invoiceNumberNeedToBuy.tr',
              currentNode: FocusNode()..requestFocus(),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'LocaleKeys.searchInvoice_invoiceNumberNeedToBuyError.tr';
                }
                if (CurrencyUtils.formatNumberCurrency(value) <= 0) {
                  return 'LocaleKeys.searchInvoice_invoiceNumberNeedToBuyErrorZero.tr';
                }
                return null;
              },
            )..isShowCounterText = false),
            UtilWidgets.sizedBoxPadding,
            BuildInputText(InputTextModel(
              iconLeading: Icons.phone_forwarded,
              textInputType: TextInputType.number,
              hintText: LocaleKeys.app_phoneContact.tr,
              inputFormatters: 3,
              maxLengthInputForm: 12,
              controller: inputPhoneController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'LocaleKeys.searchInvoice_invoicePhoneNumberNeedToBuyError.tr';
                }
                return null;
              },
            )..isShowCounterText = false),
            UtilWidgets.buildSolidButton(
              title: LocaleKeys.app_send.tr,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Get.back();
                  onSubmit?.call(
                    inputNumberController.text,
                    inputPhoneController.text,
                  );
                }
              },
            ).paddingOnly(top: AppDimens.paddingMedium)
          ],
        ).paddingOnly(
          left: AppDimens.defaultPadding,
          right: AppDimens.defaultPadding,
          bottom: AppDimens.defaultPadding,
        ),
      ),
    );
  }

  static Widget buildBottomSheetSendEmailDocument({
    Function(String email)? onSubmit,
  }) {
    final emailTextCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bottomSheetBgColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(
            AppDimens.radius30,
          ),
        ),
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildBottomHeader(),
            UtilWidgets.buildText(
              'LocaleKeys.document_sendEmailToCustomer.tr',
              style: AppTextStyle.font16Bo,
            ),
            UtilWidgets.sizedBox12,
            BuildInputText(
              InputTextModel(
                iconLeading: Icons.email,
                textInputType: TextInputType.emailAddress,
                controller: emailTextCtrl,
                inputFormatters: InputFormatterEnum.email,
                hintText: 'LocaleKeys.document_enterEmail.tr',
                autoFocus: true,
                validator: (value) {
                  if (value == null) {
                    return null;
                  }

                  final trimmed = value.trim();

                  if (trimmed.isEmpty) {
                    return 'LocaleKeys.document_emailCannotEmpty.tr';
                  }

                  if (!trimmed.isEmail) {
                    return 'LocaleKeys.document_emailInvalid.tr';
                  }

                  return null;
                },
              ),
            ),
            UtilWidgets.buildSolidButton(
              title: LocaleKeys.app_send.tr,
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  Get.back();
                  onSubmit?.call(emailTextCtrl.text);
                }
              },
            ).paddingOnly(top: AppDimens.paddingMedium)
          ],
        ).paddingOnly(
          left: AppDimens.defaultPadding,
          right: AppDimens.defaultPadding,
          bottom: AppDimens.defaultPadding,
        ),
      ),
    );
  }

  static Widget buildBottomHeader() {
    return Center(
      child: Container(
        height: AppDimens.paddingSmallest,
        width: AppDimens.sizeIconLarge,
        decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.defaultPadding)),
          color: AppColors.grayLight6,
        ),
      ).paddingSymmetric(vertical: AppDimens.defaultPadding),
    );
  }

  static Widget buildAppBarFilterButton({
    bool isFilter = false,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: 70,
      child: IconButton(
        icon: Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(
              Assets.ASSETS_ICONS_FILTER_SVG,
              width: AppDimens.sizeIconMedium,
              height: AppDimens.sizeIconMedium,
            ),
            if (isFilter)
              Positioned(
                top: 10,
                right: -3.0,
                child: Icon(
                  Icons.check_circle,
                  size: 12,
                  color: AppColors.primary2,
                ),
              )
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }

  static Widget buildListOption<T>({
    required String title,
    required List<T> items,
    required String Function(T) itemTitle,
    bool isRequired = false,
    T? selectedItem,
    ValueChanged<T>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            UtilWidgets.buildText(
              title,
              style: AppTextStyle.font14Bo.copyWith(color: AppColors.gray1),
            ),
            UtilWidgets.buildText(
              isRequired ? ' *' : '',
              style: AppTextStyle.font14Bo.copyWith(
                color: AppColors.primary2,
              ),
            ),
          ],
        ).paddingOnly(
          bottom: AppDimens.paddingSmall,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: AppDimens.paddingVerySmall,
          runSpacing: AppDimens.paddingVerySmall,
          children: items.map((item) {
            final isSelected = item == selectedItem;
            return UtilWidgets.buildChoiceChip(
              title: itemTitle(item),
              isSelected: isSelected,
              onChanged: (_) {
                onChanged?.call(item);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  static Widget buildMultipleListOption<T>({
    required String title,
    required List<T> items,
    required String Function(T) itemTitle,
    required Set<T> selectedItems,
    ValueChanged<T>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UtilWidgets.buildText(
          title,
          style: AppTextStyle.font14Bo.copyWith(color: AppColors.gray1),
        ).paddingOnly(
          bottom: AppDimens.paddingSmall,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: AppDimens.paddingVerySmall,
          runSpacing: AppDimens.paddingVerySmall,
          children: items.map((item) {
            final isSelected = selectedItems.contains(item);
            return UtilWidgets.buildChoiceChip(
              title: itemTitle(item),
              isSelected: isSelected,
              onChanged: (_) {
                onChanged?.call(item);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  static Widget buildBottomAction({
    required List<Widget> children,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: AppDimens.paddingVerySmall,
        top: AppDimens.paddingSmallest,
      ),
      decoration: BoxDecoration(
        color: AppColors.appBarBackgroundColor,
        border: Border(
          top: BorderSide(color: AppColors.primary2),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadowColor,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: children.map((e) => Expanded(child: e)).toList(),
      ),
    );
  }

  static Widget buildBottomActionButton({
    VoidCallback? onPressed,
    required String title,
    required String svgPath,
    double? svgWidth,
    double? svgHeight,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              svgPath,
              width: svgWidth,
              height: svgHeight,
              colorFilter: ColorFilter.mode(
                AppColors.gray2,
                BlendMode.srcIn,
              ),
            ),
            UtilWidgets.buildText(
              title,
              style: AppTextStyle.font12Semi.copyWith(
                color: AppColors.gray2,
              ),
              maxLine: 2,
            ).paddingOnly(top: AppDimens.paddingSmallest),
          ],
        ).paddingSymmetric(
          vertical: AppDimens.paddingVerySmall,
        ),
      ),
    );
  }

  static Widget buildTextScale(
    String text, {
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color? textColor,
    int? maxLines,
    double? fontSize,
    double? textScaleFactor,
    FontStyle? fontStyle,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextStyle? textStyle,
  }) {
    return Text(
      text.tr,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      textScaler: TextScaler.linear(textScaleFactor ?? 1),
      style: textStyle ??
          Get.textTheme.bodySmall?.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            overflow: overflow,
            fontSize: fontSize ?? AppDimens.fontSmall(),
            fontStyle: fontStyle,
            decoration: decoration,
          ),
    );
  }

  static Widget buildEmptyData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          Assets.ASSETS_IMAGES_EMPTY_FOLDER_PNG,
          width: AppDimens.sizeImage,
          height: AppDimens.sizeImage,
        ),
        Text(
          'Không có dữ liệu',
          textAlign: TextAlign.center,
          style: Get.textTheme.bodyLarge,
        ),
      ],
    );
  }

  static PreferredSizeWidget buildAppBarHrm(
    String title, {
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
    Color? actionsIconColor,
    Color? backbuttonColor,
    Color? backgroundColor,
    bool centerTitle = false,
    Widget? leading,
    List<Widget>? actions,
    bool isColorGradient = false,
    List<Color>? colorTranparent,
    PreferredSizeWidget? widget,
  }) {
    return AppBar(
      bottom: widget,

      /// ✅ BACK BUTTON
      iconTheme: IconThemeData(
        color: backbuttonColor ?? AppColors.textColorWhite,
      ),

      /// ✅ ACTION ICON
      actionsIconTheme: IconThemeData(
        color: actionsIconColor ?? AppColors.textColorWhite,
      ),

      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.textColorWhite,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),

      title: buildAppBarTitle(
        title,
        textColor: textColor ?? AppColors.textColorWhite,
      ),
      centerTitle: centerTitle,
      titleSpacing: 0,
      leading: leading,
      flexibleSpace: isColorGradient
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: colorTranparent ?? AppColors.colorHeadPayroll,
                ),
              ),
            )
          : null,
      actions: actions,
      backgroundColor:
          isColorGradient ? null : backgroundColor ?? AppColors.orange,
    );
  }
}
