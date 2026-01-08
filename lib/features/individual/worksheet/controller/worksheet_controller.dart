import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/utils/widgets/util_widgets.dart'; // Đảm bảo đúng path UtilWidgets
import 'package:get/get.dart';

class WorksheetController extends BaseGetxController {
  final selectedDate = DateTime.now().obs;

  String get monthYearDisplay =>
      'Tháng ${selectedDate.value.month}/${selectedDate.value.year}';

  final totalStandardWork = '22'.obs;
  final totalWorkMinutes = '10.560'.obs;
  final totalLateMinutes = '15'.obs;
  final totalEarlyMinutes = '0'.obs;
  final totalOTHours = '5.5'.obs;
  final totalLeaveDays = '1'.obs;

  void onSelectMonth() async {
    final result = await UtilWidgets.showMonthPicker(
      initialDate: selectedDate.value,
    );

    if (result != null) {
      selectedDate.value = result;
    }
  }
}
