import 'package:do_an_application/application/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'all_const.dart';

class AppColors {
  static bool isDarkMode =
      APP_DATA.read(AppConst.keyIsDarkTheme) ?? isDeviceDarkMode;

  static void init() {
    // Update isDarkMode when change theme
    APP_DATA.listenKey(
      AppConst.keyIsDarkTheme,
      (value) {
        isDarkMode = value ?? isDeviceDarkMode;
      },
    );
  }

  static bool get isDeviceDarkMode {
    return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;
  }

  //Hàm để trong baseTheme phải truyền giá trị vào để phân biệt giao diện
  static Color accentColorTheme(bool isDark) =>
      isDark ? darkAccentColor : lightAccentColor;

  // Những biến sử dụng trong app phải đảm bảo màu cho 2 giao diện sáng/tối
  // static bool isDarkMode => isDarkMode;

  static Color textColor() => isDarkMode ? Colors.white : Colors.black;

  static Color textHomeColor() => isDarkMode ? Colors.white : darkAccentColor;

  static Color errorText() => isDarkMode ? errorTextColor : Colors.redAccent;

  static Color orangeHighlight = const Color(0xffF6844E).withOpacity(0.2);

  static Color errorTextField() => colorFF0000;

  static Color errorTextHistory() =>
      isDarkMode ? errorTextColor : Colors.redAccent;

  static Color selectedInvoice() =>
      isDarkMode ? calendarIconColor : orangeSelected;

  static Color? selectedInvoicePressed() => isDarkMode ? null : orangeSelected;

  static Color leftBarChart() => isDarkMode ? Colors.white30 : darkAccentColor;

  static Color titleDataBarChart() =>
      isDarkMode ? Colors.white30 : bgKeyBoardbtn;

  static Color textReColor() => isDarkMode ? Colors.black : Colors.white;

  static Color hintTextColor() => isDarkMode ? Colors.white54 : Colors.black54;

  static Color dialogInvExtend() => isDarkMode ? darkAccentColor : Colors.white;

  static Color appBarColor() => isDarkMode ? darkAccentColor : Colors.white;

  static Color keyBoardColor() =>
      isDarkMode ? darkAccentColor : const Color(0xFFff7e5f);

  static Color splashColor() => isDarkMode ? darkAccentColor : orange;

  static Color subTextColor() => isDarkMode ? Colors.white54 : Colors.black87;

  static Color statusBarColor() =>
      isDarkMode ? darkAccentColor : colorBackgroundLight;

  static Color dateTimeColor() =>
      isDarkMode ? darkPrimaryColor : const Color(0xFFf7f7f7);

  static Color cardBackgroundColor() => isDarkMode ? grayDark6 : Colors.white;

  static Color linkText() => isDarkMode ? colorBlueAccent : orange;

  static Color invoiceStickyHead() => isDarkMode ? colorBlueB1FF : orange;

  static Color cardBackgroundOrange() =>
      isDarkMode ? backgroundColor : const Color(0xffFF772E);

  static Color cardBorderColor() =>
      isDarkMode ? darkAccentColor : Colors.white70;

  static Color? dividerColor() => isDarkMode ? null : darkAccentColor;

  static Color cardColors() => isDarkMode ? cardColor : Colors.white;

  static Color iconHomeSelectColor() =>
      isDarkMode ? Colors.white : darkAccentColor;

  static Color backgroundHomeColor() =>
      isDarkMode ? darkAccentColor : Colors.white;

  static Color slideActionColor() =>
      isDarkMode ? darkAccentColor : bgSlideColorLight;

  static Color iconHomeColor() => isDarkMode ? Colors.white54 : Colors.grey;

  static Color inputText() => isDarkMode ? darkPrimaryColor : lightAccentColor;

  static Color inputTextBottomSheet() =>
      isDarkMode ? darkPrimaryColor : const Color(0xffefefef);

  static Color inputQuickInvoice() =>
      isDarkMode ? darkAccentColor : const Color(0xffefefef);

  static Color inputInvExtra() =>
      isDarkMode ? darkAccentColor : lightAccentColor;

  static Color inputTextWhite() => isDarkMode ? darkPrimaryColor : Colors.white;

  static Color bgInputText() =>
      isDarkMode ? bgInputTextColor : lightAccentColor;

  static Color bottomSheet() => isDarkMode ? buttonColor : Colors.white;

  static Color primaryColor() => isDarkMode ? darkPrimaryColor : Colors.white;

  static Color chipColorTheme() => isDarkMode ? backgroundColor : orangeShade;

  static Color iconEmpty() => isDarkMode ? Colors.white30 : orangeShade;

  static Color appBarInvoice() => isDarkMode ? darkAccentColor : orange;

  static Color selectedChip() => isDarkMode ? backgroundSearchColor : orange;

  static Color titleBarChart() => isDarkMode ? Colors.white30 : darkAccentColor;

  static Color barChart() => isDarkMode ? backgroundSearchColor : chipColor;

  static Color stickyHead() => isDarkMode ? backgroundColor : lightAccentColor;

  static Color dateTimeHistory() =>
      isDarkMode ? backgroundColor : const Color(0x40f0eff2);

  static Color invoiceStatusWait() =>
      isDarkMode ? const Color(0x6688c6ed) : const Color(0xff088aec);

  static Color invoiceStatusNewly() =>
      isDarkMode ? const Color(0x6682c341) : const Color(0xff44aca0);

  static Color invoiceStatusPublished() =>
      isDarkMode ? const Color(0x66009f75) : const Color(0xff34a853);

  static Color invoiceStatusTaxDeclared() =>
      isDarkMode ? const Color(0x66394BA0) : const Color(0xff394BA0);

  static Color invoiceStatusReplaced() =>
      isDarkMode ? const Color(0x80EF4444) : const Color(0xffEF4444);

  static Color invoiceStatusHandle() =>
      isDarkMode ? Colors.purple.shade300 : const Color(0xFFfd754a);

  static Color invoiceStatusCanceled() =>
      isDarkMode ? const Color(0x80EF4444) : const Color(0xffe73526);

  static Color invoiceStatusApproved() =>
      isDarkMode ? const Color(0xffD54799) : const Color(0xff690fbb);

  static Color invoiceList() => isDarkMode ? bgInputTextColor : Colors.white;

  static Color textSearchInvProfile() =>
      isDarkMode ? Colors.white : Colors.indigo.shade700;

  static Color borderColor() => isDarkMode ? darkAccentColor : Colors.white;

  static Color statusBarInvoice() => isDarkMode ? darkAccentColor : orange;

  static Color selectedProduct() =>
      isDarkMode ? calendarIconColor : const Color(0x77f88754);

  static Color spinboxColor() => isDarkMode ? Colors.white : chipColor;

  static Color invoiceListOver() =>
      isDarkMode ? Colors.redAccent : Colors.white;

  static Color borderCard() =>
      isDarkMode ? Colors.transparent : prefixIconColor;

  static Color noSerialCert() =>
      isDarkMode ? chipColor : const Color(0xff1390e5);

  static List<Color> searchInvoice() =>
      isDarkMode ? colorGradientOrange : [Colors.white, Colors.white];

  static List<Color> barChartEmpty() =>
      isDarkMode ? colorGradientGrey : colorGradientGrey;

  static List<Color> barChartData() =>
      isDarkMode ? colorGradientBlue : colorGradientIconHome;

  static List<Color> barReChartData() =>
      isDarkMode ? colorGradientIconHome : colorGradientBlue;

  static List<Color> removeFilter() =>
      isDarkMode ? colorGradientGray : colorGradientGrey;

  static Color colorChangeTheme() =>
      isDarkMode ? Colors.blueAccent : orangeSelected;

  /// Figma colors

  static Color get greenStatus => isDarkMode ? color33059669 : colorD4F8E2;

  static Color get redStatus => isDarkMode ? color33E11D48 : colorFFE8ED;

  static Color get purpleStatus => isDarkMode ? color334F46E5 : colorF1F0FF;

  static Color get blueStatus => isDarkMode ? color330891B2 : colorD2DFFC;

  static Color get orangeStatus => isDarkMode ? color33D97706 : colorFFEAD2;

  static Color get statusDataValid => isDarkMode ? color059669 : color0B8E3F;

  static Color get defaultTextColor =>
      isDarkMode ? Colors.white : const Color(0xFF242E37);

  static Color get gray =>
      isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF242E37);

  static Color get gray3 =>
      isDarkMode ? const Color(0xffB8B9BB) : const Color(0xff5C6771);

  static Color get grayBorder =>
      isDarkMode ? const Color(0xFF919396) : colorBorder;

  static Color get primary => isDarkMode ? primaryDark2 : primaryLight2;

  static Color get colorTextNumber => isDarkMode ? colorWhite : colorBlack;

  static Color get backgroundSearch => isDarkMode ? grayDark7 : colorCancel;

  static Color get backgroundDate => isDarkMode ? grayDark7 : Colors.white;

  static Color get backgroundInput => isDarkMode ? grayDark7 : colorWhite;

  static Color get colorButtonCancel => isDarkMode ? grayDark7 : primaryLight7;

  static Color get colorButtonLeft => isDarkMode ? grayDark6 : primaryLight7;

  static Color get backgroundPrimary =>
      isDarkMode ? Colors.white : const Color(0xffFDFDFE);

  static Color get backgroundPopUp =>
      isDarkMode ? const Color(0xFF0D0D0D) : Colors.white;

  static Color get textProperties =>
      isDarkMode ? const Color(0xFF6D6E71) : const Color(0xff252121);

  static Color get backgroundWhiteBlack => isDarkMode ? colorBlack : colorWhite;

  static Color colorWhite = Colors.white;

  static Color colorBlack = Colors.black;

  static Color colorRed = Colors.red;

  static Color colorTransparent = Colors.transparent;

  static Color inputColorText() =>
      isDarkMode ? darkPrimaryColor : colorInputText;

  // isDarkMode ? Colors.white : Color(0xFF242E37);
  static Color get primary2 => isDarkMode ? primaryDark2 : primaryLight2;

  static Color get gray1 => isDarkMode ? grayDark1 : grayLight1;

  static Color get gray2 => isDarkMode ? grayDark2 : grayLight2;

  static Color get gray4 => isDarkMode ? grayDark4 : grayLight4;

  static Color get gray7 => isDarkMode ? grayDark7 : grayLight7;

  static Color get dropDownBgColor => isDarkMode ? grayDark7 : Colors.white;

  static Color get scaffoldBackgroundColor =>
      isDarkMode ? grayDark7 : const Color(0xFFF6F6F6);

  static Color get appBarBackgroundColor =>
      isDarkMode ? grayDark6 : const Color(0xFFFFFFFF);

  static Color get appBarPinTitleColor => isDarkMode ? grayDark2 : grayLight3;

  static Color get cardInfoTitleColor => isDarkMode ? grayDark2 : grayLight3;

  static Color get appBarPinShadowColor => isDarkMode ? grayDark7 : grayLight2;

  static Color get listSerialBackgroundColor =>
      isDarkMode ? grayDark7 : primaryLight2;

  static Color get navBackgroundColor =>
      isDarkMode ? const Color(0xFF262626) : Colors.white;

  static Color get navUnselectedTextColor =>
      isDarkMode ? const Color(0xFF919396) : grayLight3;

  static Color get bottomSheetTitleColor =>
      isDarkMode ? grayLight7 : grayLight1;

  static Color get bottomSheetBgColor => isDarkMode ? grayDark6 : Colors.white;

  static Color get loginBgColor => isDarkMode ? grayDark6 : Colors.white;

  static Color get patternTitleColor => isDarkMode ? primaryDark2 : grayLight1;
  static Color get textFieldFillColor => isDarkMode ? grayDark7 : Colors.white;
  static Color get textFieldHintColor => isDarkMode ? grayDark2 : grayLight4;

  static Color get colorBorderProduct =>
      isDarkMode ? primaryDark2 : Colors.white;

  static Color get colorIconButton => isDarkMode ? Colors.white : gray7;

  static Color get colorIconButtonBackground =>
      isDarkMode ? Colors.black : Colors.white;

  static Color get colorDivider => isDarkMode ? grayDark7 : grayLight6;

  static Color get textFilter => isDarkMode ? grayDark2 : grayLight4;

  static Color get textFieldHintTextColor =>
      isDarkMode ? grayDark2 : grayLight4;

  static Color get filterSelectedBgColor =>
      isDarkMode ? grayDark6 : primaryLight2;
  static Color get filterUnselectedBgColor =>
      isDarkMode ? grayDark7 : Colors.white;
  static Color get invoiceFilterStatusBorderColor =>
      isDarkMode ? grayDark3 : grayLight7;
  static Color get filterSelectedTextColor =>
      isDarkMode ? primaryDark2 : Colors.white;
  static Color get filterUnselectedTextColor =>
      isDarkMode ? grayDark3 : grayLight2;
  static Color get cardShadowColor =>
      (isDarkMode ? Colors.white : Colors.black).withOpacity(0.15);
  static Color get versionHistoryDateColor =>
      isDarkMode ? grayDark4 : grayLight5;
  static Color get recentSearchTextColor => isDarkMode ? grayDark4 : grayLight5;
  static Color get recentSearchDividerColor =>
      isDarkMode ? const Color(0xFF1E2021) : grayLight7;
  static Color get searchInvoiceHintColor =>
      isDarkMode ? grayDark2 : Colors.black;
  static Color get cardHistoryTitleColor => isDarkMode ? grayDark5 : grayLight4;
  static Color get VATTextColor => isDarkMode ? grayDark1 : grayLight4;
  static Color get VATBgColor => isDarkMode ? grayDark4 : grayLight7;
  static Color get invoiceCardBaseTitleColor =>
      isDarkMode ? grayDark1 : Colors.black;
  static Color get loginCompanyNameColor =>
      isDarkMode ? grayDark1 : Colors.black;
  static Color get introTextColor => isDarkMode ? grayDark1 : grayLight2;
  static Color get barrierColor =>
      (isDarkMode ? Colors.white : Colors.black).withOpacity(0.4);
  static Color get shimmerBaseColor =>
      isDarkMode ? const Color(0xFF3A3A3A) : Colors.grey.shade400;
  static Color get shimmerHighlightColor =>
      isDarkMode ? const Color(0xFF4A4A4A) : Colors.grey.shade100;
  static Color get choiceChipSelectedColor =>
      isDarkMode ? grayDark4 : primaryLight7;
  static Color get choiceChipBackgroundColor =>
      isDarkMode ? grayDark7 : Colors.white;
  static Color get choiceSelectedColor =>
      isDarkMode ? grayDark1 : primaryLight2;
  static Color get snackbarTextColor => isDarkMode ? grayDark6 : grayLight2;
  static Color get snackbarBgColor => isDarkMode ? grayDark1 : grayLight7;
  static const Color mainColors = Color.fromRGBO(242, 103, 36, 1);

  // Figma light colors
  static const primaryLight2 = Color(0xFFF24E1E);
  static const grayLight1 = Color.fromARGB(255, 21, 22, 24);
  static const grayLight2 = Color(0xFF33414E);
  static const grayLight3 = Color(0xFF5C6771);
  static const grayLight4 = Color(0xFF768088);
  static const grayLight5 = Color(0xFFA1A8AE);
  static const grayLight6 = Color(0xFFC0C4C8);
  static const grayLight7 = Color(0xFFEBECED);

  static Color primaryLight7 = const Color(0xffFEF1E8);

  // Figma dark colors
  static const primaryDark2 = Color(0xFFF24E1E);
  static const grayDark1 = Color(0xFFFFFFFF);
  static const grayDark2 = Color(0xFFB8B9BB);
  static const grayDark3 = Color(0xFF919396);
  static const grayDark4 = Color(0xFF6D6E71);
  static const grayDark5 = Color(0xFF4B4C4E);
  static const grayDark6 = Color(0xFF24262B);
  static const grayDark7 = Color(0xFF111214);

  // Figma general colors
  static const color3DA000 = Color(0xFF3DA000);
  static const colorECB800 = Color(0xFFECB800);
  static const colorFE0000 = Color(0xFFFE0000);
  static const colorFF0000 = Color(0xFFFF0000);

  static const colorD97706 = Color(0xFFD97706);
  static const colorFFEAD2 = Color(0xFFFFEAD2);
  static const color33D97706 = Color(0x33D97706);
  static const colorEA580C = Color(0xFFEA580C);
  static const colorFFD4BE = Color(0xFFFFD4BE);
  static const color059669 = Color(0xFF059669);
  static const colorBFFAE8 = Color(0xFFBFFAE8);
  static const color0D9488 = Color(0xFF0D9488);
  static const colorCFFFFB = Color(0xFFCFFFFB);
  static const color6B7280 = Color(0xFF6B7280);
  static const colorE3E4E8 = Color(0xFFE3E4E8);
  static const color0284C7 = Color(0xFF0284C7);
  static const colorD4F1FF = Color(0xFFD4F1FF);
  static const colorDC2626 = Color.fromARGB(196, 220, 38, 38);
  static const colorFED0D0 = Color(0xFFFED0D0);
  static const color0891B2 = Color(0xFF0891B2);
  static const colorDDF8FF = Color(0xFFDDF8FF);
  static const color330891B2 = Color(0x330891B2);

  static const colorE11D48 = Color(0xFFE11D48);
  static const colorFFE8ED = Color(0xFFFFE8ED);
  static const color33E11D48 = Color(0x33E11D48);
  static const color4F46E5 = Color(0xFF4F46E5);
  static const colorDDDBFF = Color(0xFFDDDBFF);
  static const color8B5CF6 = Color(0xFF8B5CF6);
  static const colorF1F0FF = Color(0xFFF1F0FF);
  static const color334F46E5 = Color(0x334F46E5);
  static const colorD4F8E2 = Color(0xFFD4F8E2);
  static const color33059669 = Color(0x33059669);
  static const color0B8E3F = Color(0xFF0B8E3F);

  static const color2563EB = Color(0xFF2563EB);
  static const colorD2DFFC = Color(0xFFD2DFFC);
  static const colorDB2777 = Color(0xFFDB2777);
  static const colorFFD2E6 = Color(0xFFFFD2E6);
  static const color37D100 = Color(0xFF37D100);
  static const colorFF3B30 = Color(0xFFFF3B30);

  // for Light Theme
  static const lightPrimaryColor = Color(0xFFeff6ff);
  static const lightAccentColor = Color(0xFFf0eff2);
  static const stickyHeadLight = Color(0xFFffffff);

  // for Light Theme
  static const darkPrimaryColor = Color(0xFF3e4161);
  static const darkAccentColor = Color(0xFF25273f);

  static const Color colorLoading = Color(0xFF58a0ff);
  static const Color colorBackgroundLight = Color(0xFFf7f7f7);
  static const Color chipDisable = Color(0xFFefefef);
  static const Color orange = Color(0xFFe2530c);
  static const Color orangeShade = Color(0xFFfee0d6);

  // static const Color textColor = Colors.white;
  static const Color backgroundSearchColor = Color(0xFF596AFE);
  static const Color bgSlideColorLight = Color(0xFFf9f9f9);
  static const Color errorTextLogin = Colors.white;
  static const Color cardColor = Color(0xFF414465);
  static const Color systemIconColor = Color(0xFF77EDFE);
  static const Color calendarIconColor = Color(0xFF464E88);
  static const Color calendarIconColord = Color(0xFF281F1C);
  static const Color appBarColor1 = Color(0xFF333754);
  static const Color buttonColor = Color(0xFF25273f);
  static const Color buttonColor2 = Color(0x0FF3FFFF);
  static const Color backgroundColor = Color(0xFF333753);
  static const Color bgInputTextColor = Color(0xFF3e4161);
  static const Color bgHighLight = Color(0x60FFFFFF);
  static const Color bgKeyBoard = Color(0xFF1f212d);
  static const Color bgKeyBoardbtn = Color(0xFF65686f);

  static const Color errorTextColor = Color(0xFFFFD54F);
  static const Color textColorWhite = Colors.white;

  // static const Color hintTextColor = Colors.white30;
  static const Color hintTextSolidColor = Color(0xCCFFFFFF);
  static final Color prefixIconColor = Colors.grey.shade500;
  static const Color prefixIconLogin = Colors.white;
  static const Color bgItemColor = Color(0xFF9ca4bc);
  static const Color textColorDefault = Color(0xFF111111);
  static const Color chipColor = Color(0xfff36f21);
  static const Color colorBlue67ff = Color(0xFF5967ff);
  static const Color colorBlueAccent = Colors.blueAccent;
  static const Color titleText = Colors.white54;
  static const Color colorShowCaseIcon = Colors.white;
  static const Color colorShowCaseText = Colors.white;
  static const Color colorBackgroundShowCase = Colors.white30;
  static const Color colorError = Color(0xFFff5f6d);

  static const Color textColorIncrease = Color(0xFF06beb6);
  static const Color textColorDecrease = Color(0xFFd66d75);
  static const Color colorInvoicesReplaced = Color(0xffecbb00);
  static const Color orangeSelected = Color(0xFFff7e5f);
  static const Color colorInvoicesAdjust = Color(0xFFff7e5f);
  static const Color colorGreenLight = Color(0xFF82c341);
  static const Color colorRed444 = Color(0xccEF4444);
  static const Color colorBlueB1FF = Color(0xE682B1FF);
  static const Color colorCancel = Color(0xffF8F8F8);
  static const Color colorConfirm = Color(0xffE95626);
  static const Color colorTextCancel = Color(0xff768088);
  static const Color colorBorder = Color(0xffEBECED);
  static const Color colorInputText = Color(0xFFF8F8F8);

  static Color colorInvoicesReplace = const Color(0xffffd751);
  static Color colorInvoicesAdjusted = orangeSelected;

  static const checkBoxColor = Color(0xffFF772E);

  static const List<Color> colorGradientOrange = [
    Color(0xFFff7e5f),
    Color(0xFFff5f6d),
  ];

  static const List<Color> colorGradientBlue = [
    Color(0xFF58a0ff),
    Color(0xFF5967ff),
  ];
  static const List<Color> colorGradientBlueLogin = [
    Color(0xFF5967ff),
    Color(0xFF596AFE),
  ];
  static const List<Color> colorGradientBlack = [
    Colors.black,
    Colors.black87,
  ];
  static const List<Color> colorGradientGrey = [
    Color(0xFF9ca4bc),
    Color(0xFF9ca4bc)
  ];

  static const List<Color> colorGradientGray = [
    Color(0x20FFFFFF),
    Color(0x20FFFFFF),
  ];

  static const List<List<Color>> colorGradientList = [
    [Color(0xFFD4145A), Color(0xFFFBB03B)],
    [Color(0xFF4568dc), Color(0xFFb06ab3)],
    [Color(0xFF588be5), Color(0xFF3ac9dd)],
  ];
  static const List<Color> colorPieDashboard = [
    Color(0xFF2697fe),
    Color(0xffbf5efe),
    Color(0xFF19eaaa),
    Color(0xFFffcf27),
    Color(0xFFff6057),
  ];

  static const List<Color> colorStatusHistoryTitle = [
    Color(0xFF03A9F4),
    Color(0xFFff6057),
    Color(0xFF8DBD26),
  ];
  static const List<Color> colorStatusInvoiceStatistics = [
    Color(0xFFE11D48),
    Color(0xFF0B8E3F),
    Color(0xFF4F46E5),
  ];

  static const List<Color> colorGradientIconHome = [
    Color(0xFFfd754a),
    Color(0xFFfd8058),
  ];

  static const List<Color> colorHeadPayroll = [
    Color(0xffF6921E),
    Color(0xffF15922),
  ];
}
