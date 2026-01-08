import 'package:do_an_application/base/base.dart';
import 'package:get/get.dart';

import '../../../../utils/widgets/util_widgets.dart';

class HistoryExplanationController extends BaseGetxController {
  // 1. Quản lý trạng thái ngày đang chọn và ngày đang focus trên lịch
  final selectedDay = DateTime.now().obs;
  final focusedDay = DateTime.now().obs;

  final selectedDate = DateTime.now().obs;

  String get monthYearDisplay =>
      'Tháng ${selectedDate.value.month}/${selectedDate.value.year}';

  void onSelectMonth() async {
    final result = await UtilWidgets.showMonthPicker(
      initialDate: selectedDate.value,
    );

    if (result != null) {
      selectedDate.value = result;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Khởi tạo dữ liệu ban đầu
    _fetchHistoryByDate(selectedDay.value);
  }

  /// Xử lý sự kiện khi người dùng chọn một ngày trên TableCalendar
  void onDaySelected(DateTime selected, DateTime focused) {
    // Cập nhật giá trị Rx để giao diện tự động render lại (Obx)
    selectedDay.value = selected;
    focusedDay.value = focused;

    // Gọi hàm lọc danh sách theo ngày vừa chọn
    _fetchHistoryByDate(selected);
  }

  /// Hàm giả lập lấy dữ liệu từ Server/Local theo ngày
  void _fetchHistoryByDate(DateTime date) {
    // Logic lọc dữ liệu hoặc gọi API tại đây
    // explanationHistory.value = ...
  }
}
