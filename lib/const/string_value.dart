class AppStr {
  static const String appName = 'EasyInvoice';

  // Error
  static const String errorConnectTimeOut =
      'Không có phản hồi từ hệ thống, Quý khách vui lòng thử lại sau';
  static const String errorInternalServer =
      'Lỗi xử lý hệ thống\nQuý khách vui lòng thử lại sau!!!';
  static const String error502 =
      'Server đang bảo trì. Quý khách vui lòng quay lại sau.';
  static const String error503 =
      'Server đang bảo trì. Quý khách vui lòng quay lại sau một vài phút.';
  static const String error404 =
      'Không tìm thấy đường dẫn này, xin vui lòng liên hệ Admin';
  static const String error401 =
      'Phiên đăng nhập đã hết hạn. Quý khách vui lòng đăng nhập lại';
  static const String error400 = 'Dữ liệu gửi đi không hợp lệ!';
  static const String errorConnectFailed = 'Connection failed';
  static const String errorConnectFailedStr =
      'Không thể kết nối tới máy chủ\nQuý khách vui lòng kiểm tra lại kết nối mạng';
  static const String errorPermission =
      'Bạn chưa cấp đầy đủ quyền Camera hoặc bộ nhớ để thực hiện chức năng này!';
  static const String errorInvoiceNotFound = 'Không tìm thấy hóa đơn';
  static const String errorBarcodeScan = "Lỗi! Không thể quét mã Qr";
  static const String errorSystem1 = "Có lỗi xảy ra!";
  static const String errorSystem2 =
      "\n\nChúng tôi đã nhận được thông báo lỗi và sẽ cập nhật lại ứng dụng trong thời gian sớm nhất.";
  static const String errorEmptyEmail = "Khách hàng không có email";
  static const String errorEmptyPhone = "Khách hàng không có số điện thoại";
  static const String eInvoice123 =
      "Hóa đơn điện tử theo Nghị định 123/2020/NĐ-CP";
  static const String error302 =
      'Căn cước công dân/ Mã số thuế không chính xác. Quý khách vui lòng kiểm tra lại';
  static const String error177 =
      'Tài khoản không hợp lệ. Quý khách vui lòng ĐĂNG NHẬP lại hoặc liên hệ với bộ phận hỗ trợ!';

  // key XML Invoice
  static const String XML_INVOICES = "Invoices";
  static const String INVOICE = "Invoice";
  static const String ADJUSTINV = "AdjustInv";
  static const String REPLACEINV = "ReplaceInv";
  static const String XML_INV = "Inv";
  static const String XML_PRODUCTS = "Products";

  static const String FIELD_INVOICE_IKEY = "Ikey";
  static const String FIELD_INVOICE_CUS_CODE = "CusCode";
  static const String FIELD_INVOICE_CUS_NAME = "CusName";
  static const String FIELD_INVOICE_CUS_EMAILS = "CusEmails";
  static const String FIELD_INVOICE_EMAIL = "Email";
  static const String FIELD_INVOICE_EMAIL_CC = "EmailCC";
  static const String FIELD_INVOICE_CUS_ADDRESS = "CusAddress";
  static const String FIELD_INVOICE_CUS_BANK_NO = "CusBankNo";
  static const String FIELD_INVOICE_CUS_BANK_NAME = "CusBankName";
  static const String FIELD_INVOICE_CUS_PHONE = "CusPhone";
  static const String FIELD_INVOICE_CUS_TAX_CODE = "CusTaxCode";
  static const String FIELD_INVOICE_CUS_IDENTIFICATION = "CusIdentification";
  static const String FIELD_INVOICE_ARISING_DATE = "ArisingDate";
  static const String FIELD_INVOICE_AMOUNT = "Amount";
  static const String FIELD_INVOICE_AMOUNT_IN_WORDS = "AmountInWords";
  static const String FIELD_INVOICE_BUYER = "Buyer";
  static const String FIELD_INVOICE_VAT_RATE = "VATRate";
  static const String FIELD_INVOICE_PAYMENT_METHOD = "PaymentMethod";
  static const String FIELD_INVOICE_TOTAL = "Total";
  static const String FIELD_INVOICE_EXTRA = "Extra";
  static const String FIELD_INVOICE_TYPE_HANDLE = "Type";
  static const String FIELD_INVOICE_VAT_AMOUNT = "VATAmount";
  static const String FIELD_INVOICE_EXCHANGE_RATE = "ExchangeRate";
  static const String FIELD_INVOICE_CURRENCY_UNIT = "CurrencyUnit";
  static const String FIELD_INVOICE_LAST_MODIFIED_DATE = "LastModifiedDate";
  static const String FIELD_INVOICE_CREATED_DATE = "CreatedDate";
  static const String FIELD_INVOICE_DISCOUNT_AMOUNT = "DiscountAmount";

  // Tổng tiền trước thuế của thuế KCT, 0%, 5%, 8%, 10%, KKKNT, KHAC
  static const String FIELD_INVOICE_GROSS_VALUE = "GrossValue"; // KCT
  static const String FIELD_INVOICE_GROSS_VALUE_0 = "GrossValue0"; // 0%
  static const String FIELD_INVOICE_GROSS_VALUE_5 = "GrossValue5"; // 5%
  static const String FIELD_INVOICE_GROSS_VALUE_8 = "GrossValue8"; // 8%
  static const String FIELD_INVOICE_GROSS_VALUE_10 = "GrossValue10"; // 10%
  static const String FIELD_INVOICE_GROSS_VALUE_NDeclared =
      "GrossValueNDeclared"; // KKKNT
  static const String FIELD_INVOICE_GROSS_VALUE_CONTRACTOR =
      "GrossValueContractor"; // KHAC

  // Tổng tiền thuế của thuế 0%, 5%, 8%, 10%, KCT, KKKNT, KHAC
  static const String FIELD_INVOICE_VAT_AMOUNT_0 = "VatAmount0"; // 0%
  static const String FIELD_INVOICE_VAT_AMOUNT_5 = "VatAmount5"; // 5%
  static const String FIELD_INVOICE_VAT_AMOUNT_8 = "VatAmount8"; // 8%
  static const String FIELD_INVOICE_VAT_AMOUNT_10 = "VatAmount10"; // 10%
  static const String FIELD_INVOICE_VAT_AMOUNT_NO_VAT = "VatAmountNoVAT"; // KCT
  static const String FIELD_INVOICE_VAT_AMOUNT_NDeclared =
      "VatAmountNDeclared"; // KKKNT
  static const String FIELD_INVOICE_VAT_AMOUNT_CONTRACTOR =
      "VatAmountContractor"; // KHAC

  // Tổng tiền sau thế của thuế 0%, 5%, 8%, 10%, KCT, KKKNT, KHAC
  static const String FIELD_INVOICE_AMOUNT_0 = "Amount0"; // 0%
  static const String FIELD_INVOICE_AMOUNT_5 = "Amount5"; // 5%
  static const String FIELD_INVOICE_AMOUNT_8 = "Amount8"; // 8%
  static const String FIELD_INVOICE_AMOUNT_10 = "Amount10"; // 10%
  static const String FIELD_INVOICE_AMOUNT_NO_VAT = "AmountNoVAT"; // KCT
  static const String FIELD_INVOICE_AMOUNT_NDeclared =
      "AmountNDeclared"; // KKKNT
  static const String FIELD_INVOICE_AMOUNT_OTHER = "AmountOther"; // KHAC

  static const String FIELD_PRODUCT = "Product";
  static const String FIELD_PRODUCT_NAME = "ProdName";
  static const String FIELD_PRODUCT_PRICE = "ProdPrice";
  static const String FIELD_PRODUCT_CODE = "Code";
  static const String FIELD_PRODUCT_VAT_RATE = "VATRate";
  static const String FIELD_PRODUCT_QUANTITY = "ProdQuantity";
  static const String FIELD_PRODUCT_IN_QUANTITY = "InQuantity";
  static const String FIELD_PRODUCT_OUT_QUANTITY = "OutQuantity";
  static const String FIELD_PRODUCT_UNIT = "ProdUnit";
  static const String FIELD_PRODUCT_AMOUNT = "Amount";
  static const String FIELD_PRODUCT_DISCOUNT = "Discount";
  static const String FIELD_PRODUCT_DISCOUNT_AMOUNT = "DiscountAmount";
  static const String FIELD_PRODUCT_TOTAL = "Total";
  static const String FIELD_PRODUCT_IS_SUM = "IsSum";
  static const String FIELD_PRODUCT_EXTRA = "Extra";
  static const String FIELD_PRODUCT_VAT_AMOUNT = "VATAmount";
  static const String FIELD_PRODUCT_NO = "No";
  static const String FIELD_VAT_RATE_OTHER = "VATRateOther";
  static const String FIELD_PRODUCT_DES = "Des";
  static const String FIELD_PRICE = "Price";
  static const String FIELD_NAME = "Name";
  static const String FIELD_UNIT = "Unit";
  static const String FIELD_PRODUCT_FEATURE = "Feature";
  static const String FIELD_GROSVALUENDECLARED = "GrossValueNDeclared";
  static const String FIELD_VATAMOUNTNDECLARED = "VatAmountNDeclared";
  static const String FIELD_AMOUNTNDECLARED = "AmountNDeclared";
  static const String FIELD_GROSSVALUECONTRACTOR = "GrossValueContractor";
  static const String FIELD_VATAMOUNTCONTRACTOR = "VatAmountContractor";
  static const String FIELD_AMOUNTOTHER = "AmountOther";
  static const String FIELD_VATRATEOTHER = "VATRateOther";

  // xml customer
  static const String FIELD_CUSTOMERS = "Customers";
  static const String FIELD_CUSTOMER = "Customer";
  static const String FIELD_CUSTOMER_CODE = "Code";
  static const String FIELD_CUSTOMER_ACCOUNT_NAME = "AccountName";
  static const String FIELD_CUSTOMER_NAME = "Name";
  static const String FIELD_CUSTOMER_BUYER = "Buyer";
  static const String FIELD_CUSTOMER_ADDRESS = "Address";
  static const String FIELD_CUSTOMER_TAX_CODE = "TaxCode";
  static const String FIELD_CUSTOMER_BANK_NAME = "BankName";
  static const String FIELD_CUSTOMER_BANK_ACCOUNT_NAME = "BankAccountName";
  static const String FIELD_CUSTOMER_BANK_NUMBER = "BankNumber";
  static const String FIELD_CUSTOMER_EMAIL = "Email";
  static const String FIELD_CUSTOMER_EMAIL_CC = "EmailCC";
  static const String FIELD_CUSTOMER_FAX = "Fax";
  static const String FIELD_CUSTOMER_PHONE = "Phone";
  static const String FIELD_CUSTOMER_CONTACT_PERSON = "ContactPerson";
  static const String FIELD_CUSTOMER_REPRESENT_PERSON = "RepresentPerson";
  static const String FIELD_CUSTOMER_CUSTYPE = "CusType";
  static const String FIELD_CUSTOMER_CUS_IDENTIFICATION = "CusIdentification";
  static const String FIELD_CUSTOMER_BUDGETARY_RELATIONSHIP_CODE =
      "BudgetaryRelationshipCode";
  static const String FIELD_CUSTOMER_PASSPORT_NO = "PassportNo";

  // Key Xml Vouchers - Phiếu xuất kho
  static const String XML_VOUCHERS = "Vouchers";
  static const String XML_VOUCHER = "Voucher";
  static const String FIELD_VOUCHER_CURRENCY_UNIT = "CurrencyUnit";
  static const String FIELD_VOUCHER_EXCHANGE_RATE = "ExchangeRate";
  static const String FIELD_VOUCHER_SHIPPER = "Shipper";
  static const String FIELD_VOUCHER_CONTRACT_NO = "ContractNo";
  static const String FIELD_VOUCHER_TRANSPORTATION = "Transportation";
  static const String FIELD_VOUCHER_DELIVERY_WAREHOUSE = "DeliveryWarehouse";
  static const String FIELD_VOUCHER_RECEIVING_WAREHOUSE = "ReceivingWarehouse";
  static const String FIELD_VOUCHER_SHIFTING_ORDER_CODE = "ShiftingOrderCode";
  static const String FIELD_VOUCHER_CUS_TAX_CODE = "CusTaxCode";
  static const String FIELD_VOUCHER_GOOD_EXPORTER = "GoodExporter";
  static const String FIELD_VOUCHER_GOOD_RECEIVER = "GoodReceiver";
  static const String FIELD_VOUCHER_CUS_CODE = "CusCode";
  static const String FIELD_VOUCHER_CUS_NAME = "CusName";
  static const String FIELD_VOUCHER_TOTAL = "Total";
  static const String FIELD_VOUCHER_AMOUNT = "Amount";
  static const String FIELD_VOUCHER_DISCOUNT = "Discount";
  static const String FIELD_VOUCHER_ORIGINAL_TOTAL = "OriginalTotal";
  static const String FIELD_VOUCHER_ORIGINAL_AMOUNT = "OriginalAmount";
  static const String FIELD_VOUCHER_ORIGINAL_DISCOUNT = "OriginalDiscount";
  static const String FIELD_VOUCHER_AMOUNT_IN_WORDS = "AmountInWords";
  static const String FIELD_VOUCHER_ARISING_DATE = "ArisingDate";
  static const String FIELD_VOUCHER_RECEIVER = "Receiver";
  static const String FIELD_VOUCHER_NOTE = "Note";
  static const String FIELD_VOUCHER_CONTENT_EXTRA = "ContentExtra";
  static const String FIELD_VOUCHER_EXTRA = "Extra";
  static const String FIELD_VOUCHER_IKEY = "Ikey";

  static const String FIELD_VOUCHER_MSHIFTING_ORDER_DATE = "MShiftingOrderDate";
  static const String FIELD_VOUCHER_ECONOMIC_CONTRACTS_NO =
      "EconomicContractsNo";

  static const String FIELD_EXTRA_ROW_DISCOUNT = "RowDiscount";
  static const String FIELD_EXTRA_TongXuat = "TongXuat";
  static const String FIELD_EXTRA_NgayXuat = "NgayXuat";
  static const String FIELD_EXTRA_NgayNhap = "NgayNhap";
}
