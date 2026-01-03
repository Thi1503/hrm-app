// error user message
abstract class InvoiceErrors {
  const InvoiceErrors._();
  static const errorCodeUser100 = "Thiếu dữ liệu hoá đơn";
  static const errorCodeUser102 = "Thiếu dữ liệu ikey hoá đơn";
  static const errorCodeUser104 = "Chưa nhập thông tin khách hàng";
  static const errorCodeUser105 = "Tên tất cả sản phẩm đang bỏ trống";
  static const errorCodeUser106 = "Chữ ký số không hợp lệ";
  static const errorCodeUser107 = "Chưa chọn mẫu số hoá đơn";
  static const errorCodeUser108 = "Chưa nhập thông tin email";
  static const errorCodeUser109 = "Thiếu mã CQT cấp";
  static const errorCodeUser110 = "Chưa chọn hoá đơn gửi mail";
  static const errorCodeUser111 = "Mẫu số hoá đơn không khả dụng";
  static const errorCodeUser112 = "Địa chỉ Email không hợp lệ";
  static const errorCodeUser113 = "Mẫu số hoá đơn không khả dụng";
  static const errorCodeUser114 = "Mẫu số hoá đơn không khả dụng";
  static const errorCodeUser115 =
      "Số hóa đơn không tồn tại trong dải hóa đơn đang truyền lên";
  static const errorCodeUser116 =
      "Đơn hàng được chọn không cùng mẫu số, ký hiệu";
  static const errorCodeUser117 =
      "Mẫu (Pattern)/Ký hiệu (Serial) có giá trị không hợp lệ hoặc không khả dụng";
  static const errorCodeUser118 = "Sai mẫu số của hóa đơn điều chỉnh!";
  static const errorCodeUser119 = "Sai ký hiệu của hóa đơn điều chỉnh!";
  static const errorCodeUser120 = "Dải hóa đơn đã hết số!";
  static const errorCodeUser121 = "Thời gian không đúng định dạng dd/MM/yyyy";
  static const errorCodeUser122 = "Số hóa đơn không hợp lệ";
  static const errorCodeUser123 = "";
  static const errorCodeUser124 =
      "Mốc thời gian từ ngày ... không được lớn hơn đến ngày ...";
  static const errorCodeUser125 = "Khóa đã tồn tại";
  static const errorCodeUser126 = "Số hóa đơn đã tồn tại";
  static const errorCodeUser127 = "Sai định dạng XML";
  static const errorCodeUser128 = "Ikeys không tồn tại";
  static const errorCodeUser130_135 =
      "Không thể cập nhật hóa đơn đã có chữ ký số!";
  static const errorCodeUser135_140 =
      "Không thể chuyển đổi hóa đơn chưa đăng ký hoặc đã hủy!";
  static const errorCodeUser140_145 =
      "Không thể thay thế hóa đơn chưa đăng ký hoặc đã hủy!";
  static const errorCodeUser145_150 =
      "Không thể hủy hóa đơn chưa có chữ ký số!";
  static const errorCodeUser150_155 =
      "Không thể phát hành hóa đơn chưa được duyệt!";
  static const errorCodeUser156 = "Trạng thái của hóa đơn không hợp lệ!";
  static const errorCodeUser157 =
      "Vi phạm quy tắc ngày tạo lập - ngày phát hành";
  static const errorCodeUser158 =
      "Loại hoá đơn phát hành đang không giống nhau, quý khách vui lòng kiểm tra lại.";
  static const errorCodeUser159 = "Không thể xóa hóa đơn đã có chữ ký số!";
  static const errorCodeUser160 =
      "Không thể phát hành hóa đơn chưa được duyệt!";
  static const errorCodeUser161 =
      "Không thể điều chỉnh hóa đơn đã chưa được ký hoặc đã hủy!";
  static const errorCodeUser162 =
      "Không thể thay thế hóa đơn đã có chưa được ký hoặc hủy";
  static const errorCodeUser163 = "Không thể cập nhật hóa đơn đã có chữ ký số";
  static const errorCodeUser164 = "Không thể hủy hóa đơn chưa được ký";
  static const errorCodeUser165 = "Hóa đơn không tồn tại trong hệ thống!";
  static const errorCodeUser166 =
      "Không thể tải XML của hóa đơn không trực thuộc chi nhánh";
  static const errorCodeUser167 =
      "Không thể chuyển đổi hóa đơn không trực thuộc chi nhánh";
  static const errorCodeUser168 =
      "Số hóa đơn không tồn tại trong hệ thống!";
  static const errorCodeUser169 = "Ikey đã tồn tại trong hệ thống";
  static const errorCodeUser170 =
      "Hóa đơn này đã có ikey, không thể gán ikey khác";
  static const errorCodeUser171 = "Không thể tải XML do hóa đơn không hợp lệ!";
  static const errorCodeUser172 =
      "Không thể chuyển đổi hóa đơn đã hủy hoặc hóa đơn chưa chưa được kí";
  static const errorCodeUser173 =
      "Chỉ được phát hành 1 hóa đơn thay thế/ điều chỉnh trong 1 lần phát hành";
  static const errorCodeUser174 =
      "Chưa có quyền phát hành vào dải hóa đơn chờ ký";
  static const errorCodeUser175 = "Chuỗi xác thực không hợp lệ";
  static const errorCodeUser176 = "Hệ thống chưa được khởi tạo";
  static const errorCodeUser177 =
      "Tài khoản không hợp lệ hoặc chưa được kích hoạt";
  static const errorCodeUser178 =
      "Tài  khoản của bạn không có quyền thực hiện chức năng này";
  static const errorCodeUser188 = "Gói tin chứa số lượng sản phẩm quá lớn";
  static const errorCodeUser189 = "Gói tin chứa số lượng khách hàng quá lớn";
  static const errorCodeUser190 =
      "Số lượng hoá đơn trống cách dải không hợp lệ";
  static const errorCodeUser191 =
      "Số lượng hoá đơn trống cần tạo vượt quá số lượng hoá đơn còn lại của dải";
  static const errorCodeUser192 = "Gói tin chứa số lượng hoá đơn quá lớn";
  static const errorCodeUser193 =
      "Yêu cầu đang được xử lý, vui lòng chờ trong giây lát";
  static const errorCodeUser194 =
      "API không hỗ trợ trong chế độ duyệt hoá đơn. Liên hệ Easy Invoice để biết thêm thông tin";
  static const errorCodeUser195 =
      "Máy chủ hiện không cấu hình hỗ trợ ký token, liên hệ Easy Invoice để biết thêm chi tiết";
  static const errorCodeUser196 =
      "Máy chủ hiện không cấu hình ký HSM, liên hệ Easy Invoice để được hỗ trợ";
  static const errorCodeUser197 = "Hoá đơn số lớn hơn số lượng tối đa của dải";
  static const errorCodeUser198 = "Số hoá đơn không tuần tự";
  static const errorCodeUser199 = "Lỗi không xác định";
  static const errorCodeUser208 =
      "Tờ khai đăng ký mới/thay đổi thông tin chưa có kết quả của Cơ quan thuế.";
  static const errorCode100DB =
      "Kiểm tra lại thông tin dữ liệu gửi lên hệ thống hoặc liên hệ hỗ trợ";
  static const errorCode102DB = "Vui lòng liên hệ với bộ phận hỗ trợ!";
  static const errorCode104DB =
      "Bạn vui lòng nhập lại thông tin khách hàng của hoá đơn";
  static const errorCode105DB =
      "Bạn vui lòng nhập lại thông tin sản phẩm của hoá đơn";
  static const errorCode106DB =
      "Bạn vui lòng kiểm tra thông tin và thời hạn chữ ký số";
  static const errorCode107DB =
      "Bạn vui lòng chọn mẫu và ký hiệu để đồng bộ dữ liệu lên hóa đơn";
  static const errorCode108DB = "Bạ̣n vui lòng nhập đầy đủ dữ liệu";
  static const errorCode109DB = "Vui lòng liên hệ với bộ phận hỗ trợ!";
  static const errorCode110DB = "Vui lòng liên hệ với bộ phận hỗ trợ!";
  static const errorCode111DB =
      "Vui lòng kiểm tra thông tin mẫu số trong cấu hình cửa hàng";
  static const errorCode112DB = "Vui lòng nhập đúng định dạng Email";
  static const errorCode113DB =
      "Vui lòng kiểm tra thông tin mẫu số trong cấu hình cửa hàng";
  static const errorCode114DB =
      "Vui lòng kiểm tra thông tin mẫu số trong cấu hình cửa hàng";
  static const errorCode115DB =
      "Vui lòng kiểm tra số hoá đơn còn lại trong dải hoá đơn";
  static const errorCode116DB =
      "Vui lòng chọn đơn hàng có cùng mẫu số, ký hiệu";
  static const errorCode117DB =
      "Vui lòng kiểm tra lại thông tin mẫu số, ký hiệu";
  static const errorCode118DB =
      "Mẫu của hóa đơn điều chỉnh không đúng, vui lòng kiểm tra lại";
  static const errorCode119DB =
      "Ký hiệu của hóa đơn điều chỉnh không đúng, vui lòng kiểm tra lại";
  static const errorCode120DB =
      "Dải hóa đơn đã hết số, vui lòng liên hệ với bộ phận hỗ trợ để mua thêm";
  static const errorCode121DB =
      "Vui lòng nhập thời gian theo đúng định dạng dd/MM/yy";
  static const errorCode122DB = "Vui lòng kiểm tra lại số hoá đơn phát hành";
  static const errorCode123DB = "";
  static const errorCode124DB = "Vui lòng kiểm tra lại khoảng thời gian";
  static const errorCode125DB = "Vui lòng kiểm tra lại thông tin hóa đơn ";
  static const errorCode126DB = "Vui lòng kiểm tra lại thông tin hóa đơn ";
  static const errorCode127DB =
      "Vui lòng chụp lại mã lỗi và liên hệ với bộ phận hỗ trợ";
  static const errorCode128DB = "Vui lòng liên hệ với bộ phận hỗ trợ";
  static const errorCode130_135DB =
      "Hóa đơn đã có chữ ký số, không được phép cập nhật";
  static const errorCode135_140DB =
      "Hoá đơn chưa ký hoặc hủy, không chuyển đổi được";
  static const errorCode140_145DB =
      "Hoá đơn chưa ký hoặc hủy, không thay thế được";
  static const errorCode145_150DB = "Hóa đơn chưa ký, không hủy được";
  static const errorCode150_155DB = "Hóa đơn chưa được duyệt";
  static const errorCode156DB =
      "Vui lòng kiểm tra lại trạng thái hóa đơn";
  static const errorCode157DB =
      "Vui lòng kiểm tra lại ngày hóa đơn của hóa đơn trước và sau của hóa đơn này";
  static const errorCode158DB =
      "Không thể phát hành đồng thời nhiều hóa đơn thay thế hoặc điều chỉnh";
  static const errorCode159DB =
      "Lưu ý : Hóa đơn đã có chữ ký số không xóa được";
  static const errorCode160DB =
      "Hóa đơn chưa được duyệt, không thể phát hành";
  static const errorCode161DB =
      "Hóa đơn chưa được ký hoặc đã hủy chưa thể điều chỉnh, vui lòng kiểm tra trạng thái hóa đơn trên hệ thống EasyInvoice";
  static const errorCode162DB =
      "Hóa đơn chưa ký hoặc hủy không thay thế được, vui lòng kiểm tra trạng thái hóa đơn trên hệ thống EasyInvoice";
  static const errorCode163DB =
      "Hóa đơn đã có chữ ký số, không thể cập nhật, vui lòng kiểm tra trạng thái hóa đơn trên hệ thống EasyInvoice";
  static const errorCode164DB =
      "Hóa đơn chưa ký không thể hủy, vui lòng kiểm tra trạng thái hóa đơn trên hệ thống EasyInvoice";
  static const errorCode165DB =
      "Vui lòng kiểm tra lại hóa đơn và liên hệ với bộ phận hỗ trợ";
  static const errorCode166DB = "";
  static const errorCode167DB = "";
  static const errorCode168DB =
      "Vui lòng kiểm tra lại số hóa đơn và liên hệ với bộ phận hỗ trợ";
  static const errorCode169DB =
      "Vui lòng phát hành lại hoá đơn mới hoặc liên hệ với bộ phận hỗ trợ";
  static const errorCode170DB =
      "Vui lòng phát hành lại hoá đơn mới hoặc liên hệ với bộ phận hỗ trợ";
  static const errorCode171DB =
      "Hóa đơn đã bị hủy hoặc chưa ký không tải được XML, vui lòng kiểm tra lại trạng thái hóa đơn";
  static const errorCode172DB =
      "Hóa đơn đã bị̣ hủy hoặc chưa ký không chuyển đổi được, vui lòng kiểm tra lại trạng thái hóa đơn";
  static const errorCode173DB =
      "Vui lòng kiểm tra lại hoá đơn được chọn phát hành";
  static const errorCode174DB = "Vui lòng liên hệ bộ phận hỗ trợ";
  static const errorCode175DB =
      "Vui lòng kiểm tra lại thông tin tài khoản hoặc thời gian trên thiết bị của bạn";
  static const errorCode176DB =
      "Hệ thống này chưa được khởi tạo, vui lòng liên hệ với bộ phận kỹ thuật EasyInvoice để được hỗ trợ";
  static const errorCode177DB =
      "Tài khoản không hợp lệ, vui lòng liên hệ với bộ phận kỹ thuật EasyInvoice để được hỗ trợ";
  static const errorCode178DB =
      "Tài khoản đang sử dụng bị tắt quyền tích hợp, vui lòng liên hệ với bộ phận kỹ thuật EasyInvoice để được hỗ trợ";
  static const errorCode188DB = "Tối đa 400 sản phẩm trong 1 invoice";
  static const errorCode189DB = "Tối đa 100 khách hàng / request";
  static const errorCode190DB = "Dải hóa đơn trên hệ thống không đủ số";
  static const errorCode191DB = "Dải hóa đơn trên hệ thống không đủ số";
  static const errorCode192DB = "Tối đa 200 hóa đơn / request";
  static const errorCode193DB =
      "Request này đã được gửi lên trước đó và đã bị chặn bởi cache.";
  static const errorCode194DB =
      "Hệ thống đang có cấu hình yêu cầu duyệt hóa đơn mới được ký, không thể ký luôn được";
  static const errorCode195DB =
      "API đang gọi sử dụng kiểu ký Token, tuy nhiên hệ thống web đang cấu hình kiểu ký HSM. Đổi lại API hoặc liên hệ EasyInvoice đổi kiểu ký số";
  static const errorCode196DB =
      "API đang gọi sử dụng kiểu ký HSM, tuy nhiên hệ thống web đang cấu hình kiểu ký Token. Đổi lại API hoặc liên hệ EasyInvoice đổi kiểu ký số";
  static const errorCode197DB =
      "Số hóa đơn cần tạo lớn hơn số hóa đơn tối đa của dải truyền lên";
  static const errorCode198DB =
      "Chưa tạo dải hóa đơn chứa số hóa đơn cần đẩy lên";
  static const errorCode199DB = "Liên hệ easyInvoice để được hỗ trợ.";
  static const errorCode208DB = "Vui lòng kiểm tra lại sau!";
}
