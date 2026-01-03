import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDimens {
  static double fontSize10() => 10.divSF;
  static double fontSmallest() => 12.divSF;
  static double fontSmall() => 14.divSF;
  static double fontMedium() => 16.divSF;
  static double fontBig() => 18.divSF;
  static double fontBiggest() => 20.divSF;
  static double fontSize24() => 24.divSF;

  static const double sizeImage = 50;
  static const double sizeImageMedium = 70;
  static const double sizeImageBig = 90;
  static const double sizeImageLarge = 200;

  static const double sizeTextSmall = 12;
  static const double btnSmall = 20;
  static const double btnRecommend = 30;
  static const double btnDefault = 40;
  static const double btnMedium = 50;
  static const double btnLarge = 70;
  static const double btnDefaultFigma = 38;
  static const double btnLargeFigma = 42;
  static const double btnLoginFigmaHeight = 54;
  static const double btnFloatingButton = 48;
  static const double btnHeigh46 = 46;

  static const double sizeIcon = 20;
  static const double sizeIconMedium = 24;
  static const double sizeIconSpinner = 30;
  static const double sizeIconLarge = 36;
  static const double sizeIconExtraLarge = 200;
  static const double sizeDialogNotiIcon = 40;
  static const double sizeDialogButton = 38;
  static const double sizeIconDefault = 16;
  static const double sizeIconSmall = 18;
  static const double size42 = 42;

  static const double heightChip = 30;
  static const double widthChip = 100;
  static const double width35 = 35;
  static const double height30 = 30;

  static const int maxLengthDescription = 250;

  static const double defaultPadding = 16.0;
  static const double paddingSmallest = 4.0;
  static const double paddingVerySmall = 8.0;
  static const double paddingSmall = 12.0;
  static const double paddingMedium = 20.0;
  static const double paddingHuge = 32.0;
  static const double paddingExtra = 64.0;
  static const double paddingItemList = 18.0;
  static const double padding6 = 6.0;
  static const double padding10 = 10.0;
  static const double padding24 = 24.0;
  static const double padding25 = 25.0;

  static const double showAppBarDetails = 200;
  static const double sizeAppBarBig = 120;
  static const double sizeAppBarMedium = 92;
  static const double sizeAppBar = 72;
  static const double sizeAppBarSmall = 44;
  static const double sizeCancel = 149;
  static const bottomAppBarHeight = 60.0;

  // radiusBorder
  static const double radius2 = 2;
  static const double radius3 = 3;
  static const double radius4 = 4;
  static const double radius6 = 6;
  static const double radius8 = 8;
  static const double radius13 = 13;
  static const double radius20 = 20;
  static const double radius30 = 30;

  // Margins
  static const horizontalMargin16 = SizedBox(width: 16.0);

  static const verticalMargin16 = SizedBox(height: 16.0);

  // home
  static const double sizeItemNewsHome = 110;
  static const double heightImageLogoHome = 50;
  // divider
  static const double paddingDivider = 15.0;

  // appbar
  static const double paddingSearchBarBig = 50;
  static const double paddingSearchBar = 45;
  static const double paddingSearchBarMedium = 30;
  static const double paddingSearchBarSmall = 10;

  //minutes
  static double sizeA4Height = 3508;
  static double sizeA4Width = 2480;
  static double signA4Height = 60.hA4;
  static double signA4Width = 200.wA4;

  //other
  static const double paddingTitleAndTextForm = 3;
  static double bottomPadding() {
    return Platform.isIOS ? AppDimens.paddingMedium : AppDimens.paddingSmall;
  }

  // sign pdf
  static double webPdfWidth = 590.0;
  static double webPdfHeight = 835.0;
  static double get heightDivWidth => webPdfHeight / webPdfWidth;
  static double get widthDivHeight => 1.0 / heightDivWidth;
  static double get pdfHeight => Get.width * heightDivWidth;
  static double get scaleFactor => webPdfWidth / Get.width;
  static double get rectBoxHeight => 60 / scaleFactor;
  static double get rectBoxWidth => 200 / scaleFactor;
}

extension GetSizeScreen on num {
  /// Tỉ lệ fontSize của các textStyle
  double get divSF {
    return this / Get.textScaleFactor;
  }

  // Tăng chiều dài theo font size
  double get mulSF {
    return this * Get.textScaleFactor;
  }

  // Tỉ lệ màn hình dọc A4
  double get hA4 {
    return this *
        (MediaQueryData.fromView(View.of(Get.context!)).size.height / 3508);
  }

  // Tỉ lệ màn hình ngang A4
  double get wA4 {
    return this *
        (MediaQueryData.fromView(View.of(Get.context!)).size.width / 2480);
  }
}

extension RoundNumber on double {
  int get lengthNumber => toString()
      .split('.')
      .fold(0, (previousValue, element) => previousValue + element.length);
}
