import 'dart:io';

class AppConst {
  const AppConst._();

  /// Base URL cho API
  /// Android Emulator: 10.0.2.2 -> localhost của máy host
  /// iOS Simulator / Web: localhost
  static String get baseUrl {
    if (Platform.isAndroid) {
      return "http://10.0.2.2:8086";
    }
    return "http://localhost:8086";
  }

  static const String appName = "Hoá đơn điện tử";
  static const String appStoreId = "1556784655";
  static const String aboutUsUrl = "https://easyinvoice.vn/";
  static const String facebook =
      "https://www.facebook.com/groups/phanmemhoadondientu";
  static const String youtube =
      "https://www.youtube.com/channel/UCfvaQ1YDoHIknMPdOR-jl_A";
  static const String zalo = "https://zalo.me/3525050476090793203";
  static const String telSupportNumber = "tel:1900565653";

  //base
  static const int pageSize = 10;
  static const int defaultPage = 1;
  // Thời gian timeout API, tính bằng ms
  static const int requestTimeOut = 15000; //ms

  static const int millisecondsDefault = 1000;
  static const int limitPhone = 10;
  static const int responseSuccess = 2;
  static const int codeSuccess = 200;
  static const int currencyUtilsMaxLength = 12;

  static const int maxLengthInvoiceNo = 7;
  static const int maxLengthCusName = 400;

  ///giá trị mặc định phần nghìn
  static const bool isDot = false;

  //login
  static const int codeBlocked = 400;
  static const int codeAccountNotExist = 401;
  static const int codePasswordNotCorrect = 402;

  // hive hrm
  static const String keyToken = 'key_token';
  static const String keyRole = 'key_role';

// hive
  static const String keyUserName = 'key_user_name';
  static const String keyShowIntro = 'key_show_intro';
  static const String keySesionLogin = 'key_sesion_login';
  static const String keyPassword = 'key_password';
  static const String keyComName = 'key_com_name';
  static const String keyTokenDevice = "key_token_device";
  static const String keyTheme = 'key_theme';
  static const String keyEmail = 'key_email';
  static const String keyPatternFilter = 'key_pattern_filter';
  static const String keySerialFilter = 'key_serial_filter';
  static const String keyUrl = 'key_url';
  static const String keyTaxCodeCompany = 'key_taxcode_company';
  static const String keyRepresentPerson = 'key_represent_person';
  static const String keyAddressCompany = 'key_address_company';
  static const String keyLanguageIsVN = 'key_language_isVN';
  static const String keyIsDarkTheme = "keyIsDarkTheme";
  static const String keyOldTaxCodeCompany = 'key_old_taxcode_company';
  static const String keyLoginFirstTimeSesion = 'key_login_firsttime_sesion';
  static const String keyFingerprint = 'key_fingerprint';
  static const String keyCreatePlace = 'key_create_place';
  static const String keyPopupNotifications = 'key_popup_notifications';

  static const String keyLastPaymentMethod = 'key_last_payment_method';
  static const String keyLastPaymentMethodEnum = 'key_last_payment_method_enum';
  static const String keyVatRateType = 'key_vat_rate_type';
  static const String keyOtherVatRate = 'key_other_vat_rate';
  static const String keyPaymentMethodType = 'key_other_payment_method_type';
  static const String keyOtherPaymentMethod = 'key_other_payment_method';

  static const String keyShowInAppReview = 'key_show_in_app_review';
  static const String keyShowInAppReviewShared =
      'key_show_in_app_review_shared';
  static const String keyShowDialogSwitchToPattern2025 =
      'key_show_dialog_switch_to_pattern_2025';

  //show case hive
  static const String keyShowCaseInvoicesPattern =
      'key_show_case_invoices_pattern';
  static const String keyShowCaseInvoicesFilter =
      'key_show_case_invoices_filter';
  static const String keyShowCaseInvoicesAction =
      'key_show_case_invoices_action';
  static const String keyShowCaseCreationInvoiceDateTimeSerial =
      'key_show_case_creation_invoice_datetime_pattern';
  static const String keyShowCaseCreationInvoiceProduct =
      'key_show_case_creation_invoice_product';
  static const String keyShowCaseCreationInvoiceProductSwipe =
      'key_show_case_creation_invoice_product_swipe';
  static const String keyShowCaseCreationInvoiceTitle =
      'key_show_case_creation_invoice_title';

  //error
  static const int error500 = 500;
  static const int error404 = 404;
  static const int error401 = 401;
  static const int error400 = 400;
  static const int error502 = 502;
  static const int error503 = 503;

  static const String invoiceSeparator = " | ";
  static const String vnd = "VNĐ";
  static const String vndEn = "VND";
  static const String millionSort = 'tr';
  static const String billion = 'tỷ';
  static const String moneySpaceStr = ",";
  static const int moneySpacePos = 3;

  //hive
  static const String hiveFindHistory = "hiveFind";
  static const String hiveFindNoHistory = "hiveFindNo";

  //product detail
  static const String detailProduct = "detail_product";
  static const String createProduct = "create_product";
  static const String editProduct = "edit_product";
  static const String duplicateProduct = "duplicate_product";

  static const int maxLengthProvince = 50;
}
