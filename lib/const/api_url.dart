class ApiUrl {
  const ApiUrl._();

  // --------- EasyInvoiceMobile ----------
  // static const String urlBase =
  //     'http://2301082948097.softdreams.vn/'; // Server Test
  // static const String urlBase =
  //     'http://test7802.softdreams.vn'; // Server Test 78
  // static const String urlBase =
  //     'http://mobimgr.easyinvoice.com.vn/'; // Server Invoice

  static const String urlCheckTaxCode =
      'http://sadmin78.softdreams.vn/api/manager/getcompany';

  // static const String urlCheckTaxCode =
  //     'https://sadmin.easyinvoice.vn/api/manager/getcompany';

  static const String urlUpdateCompany = '/api/publish/updateCompany';
  static const String urlLogin = '/api/account/verify';

  static const String urlProductSearch = '/api/product/search';
  static const String urlCustomerSearch = '/api/customer/search';
  static const String urlInvoiceDetail = '/api/invoice/getdetail';
  static const String urlInvoiceStrip = '/api/invoice-strip/search';
  static const String urlInvoiceSearch = '/api/invoice/search';
  static const String urlCustomerDetail = '/api/customer/getDetail';
  static const String urlUpdateCustomer = '/api/publish/updateCustomer';
  static const String urlInvoiceViewInvoice = '/api/publish/viewInvoice';
  static const String urlViewInvoiceTemplateCQT =
      '/api/publish/viewInvoiceTemplateCQT';
  static const String urlRemoveUnsignedInvoice =
      '/api/business/removeUnsignedInvoice';
  static const String urlIssueInvoices = '/api/publish/issueInvoices';
  static const String urlUpdateInvoiceDate = '/api/publish/updateInvoiceDate';
  static const String urlSendIssuanceNotice = '/api/business/sendMailNotice';
  static const String urlSendIssuanceNoticeError =
      '/api/business/sendMailNoticeError';
  static const String urlGetInvoicePdf = '/api/publish/getInvoicePdf';
  static const String urlCheckInvoiceState = '/api/publish/checkInvoiceState';
  static const String urlHistoryInvoice = '/api/invoice/invoiceHistory';

  //password
  static const String urlChangePassword = '/api/account/changePassword';

  //invoice creation
  static const String urlPublishImportInvoice = '/api/publish/importInvoice';
  static const String urlSendErrorNotice = '/api/business/sendErrorNotice';
  static const String urlDeclarationSearch = '/api/declaration/search';
  static const String urlGetDeclarationInfo =
      '/api/declaration/get-declaration-info';
  static const String urlViewDeclaration = '/api/declaration/viewDeclaration';
  static const String urlGetDeclarationTbdkdtHtml =
      '/api/declaration/getPattern01TBDKDT';

  // Phát hành phiếu xuất kho
  static const String urlIssueVouchers = '/api/inventory/issueVouchers';
  // Tạo phiễu xuất kho
  static const String urlImportVouchers = '/api/inventory/importVouchers';
  // Danh sách phiếu xuất kho
  static const String urlInventorySearch = '/api/inventory/search';
  // Chi tiết phiếu xuất kho
  static const String urlInventoryDetail = '/api/inventory/getdetail';
  // Xem phiếu xuất kho HTML
  static const String urlViewVoucher = '/api/inventory/viewTicket';
  // Tải PXK PDF
  static const String urlGetVoucherPdf = '/api/inventory/downloadVoucher';
  // Xóa PXK chưa phát hành (chưa ký số)
  static const String urlRemoveVoucher = '/api/inventory/removeVoucher';
  // Gửi email thông báo phát hành phiếu xuất kho
  static const String urlSendVoucherNotice = '/api/inventory/sendMailNotice';
  // Hủy PXK
  static const String urlCancelVoucher = '/api/inventory/cancelVoucher';
  // Điều chỉnh PXK - Ký luôn
  static const String urlAdjustVoucher = '/api/inventory/adjustTicket';
  // Điều chỉnh PXK - Lưu nháp
  static const String urlAdjustUnsignedVoucher =
      '/api/inventory/importUnsignedAdjustment';
  // Thay thế PXK - Ký luôn
  static const String urlReplaceVoucher = '/api/inventory/replaceTicket';
  // Thay thế PXK - Lưu nháp
  static const String urlReplaceUnsignedVoucher =
      '/api/inventory/importUnsignedReplacement';

  static const String urlCreateMinutes = '/api/document/createOrUpdate';
  static const String urlGetMinutes = '/api/document/getDocument';
  static const String urlGetPdfMinutes = '/api/document/getDocumentPdf';
  static const String urlSendMailMinutes = '/api/document/SendMail';
  static const String urlSendPdfSignature = '/api/document/WrapSignature';
  static const String urlExtraInfo = '/api/company/extraInfo';
  static const String urlDropdownInvExtraInfo =
      '/api/company/dropdownInvExtraInfo';
  static const String urlGetAllProvince = '/api/util/province';

  static const String urlPublishImportAndIssueInvoice =
      '/api/publish/importAndIssueInvoice';
  static const String urlGetListBank = 'https://api.vietqr.io/v2/banks';

  //handle, replace, cancle
  static const String urlAdjustInvoice = '/api/business/adjustInvoice';
  static const String urlReplaceInvoice = '/api/business/replaceInvoice';
  static const String urlCancelInvoice = '/api/business/cancelInvoice';
  static const String urlDeleteCustomer = '/api/customer/delete';
  static const String checkTaxCode =
      'http://utilsrv.easyinvoice.com.vn/api/company/info';
  static const String urlUnsignedAdjustment =
      '/api/business/importUnsignedAdjustment';
  static const String urlUnsignedReplacement =
      '/api/business/importUnsignedReplacement';

  static const String urlUpdateProduct = '/api/publish/updateProduct';
  static const String urlDeleteProduct = '/api/product/delete';

  //notification
  static const String urlNotification = '/api/business/expiredWarning';
  static const String urlGetNotify = '/api/NotifyManager/getNotify';

  //dashboard
  static const String urlDashboardModel = '/api/invoice/invoiceStatistics';
  static const String urlPieChartModel = '/api/invoice-strip/countInvoiceType';
  static const String urlBarChartModel =
      '/api/invoice-strip/countInvoiceEachMonth';
  static const String urlPublishViewInvoiceTemplate =
      '/api/publish/viewInvoiceTemplate';
  static const String urlInvoiceStatisticModel =
      '/api/m/invoice/invoice-statistics';

  // email history
  static const String urlEmailHistory = '/api/mailHistory/search';
  static const String urlResendMail = '/api/mailHistory/resendMail';

  // api search
  static const String urlBaseSearch = 'http://mobileapi.easyinvoice.com.vn/api';
  static const String urlSearchInvoiceByQr =
      '$urlBaseSearch/invoice/getpdfbyqrcode';
  static const String urlSearchInvoicebyKey = '$urlBaseSearch/invoice/getpdf';

  //crm url
  static const String accessToCRM = "https://testcrm.softdreams.vn/api/auth";
  static const String sendFeedback =
      "https://testcrm.softdreams.vn/api/createCustomerFeedback";

  // Kiểm tra get config hóa đơn
  static const String urlGetConfig = "/api/util/get-config";
  static const String urlApproveInvoice = "/api/approval-inv/approve";

  //api news html
  static const String urlGetNews =
      "https://easyinvoice.vn/wp-json/custom/v1/posts-html";

  // Thông báo sai sót
  static const String urlCreatedErrorNotice =
      "/api/noticeErrInvs/list-invoice-notification-issues";
  static const String urlGetErrorNoticeDetail =
      "/api/noticeErrInvs/GetErrorInvs";
  static const String urlDeleteErrorInvs = "/api/noticeErrInvs/DeleteErrorInvs";
  static const String urlGetNoticeErrorUnmadeInv =
      "/api/noticeErrInvs/noticeErrorUnmadeInv";
  static const String urlCreateErrorInvs = '/api/noticeErrInvs/CreateErrorInvs';
  static const String urlUpdateErrorInvs =
      '/api/noticeErrInvs/UpdateErrorNotice';
  static const String urlSignNotice = '/api/noticeErrInvs/SignNotice';

  // Danh sách hoá đơn đủ điều kiện làm TBSS
  static const String urlNoticeErrInvsSearch = "/api/noticeErrInvs/search";
}
