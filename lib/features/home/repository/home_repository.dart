import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/api_url.dart';
import 'package:do_an_application/features/home/models/attendance_log.dart';
import 'package:do_an_application/utils/date_utils.dart';

class HomeRepository extends BaseRepository {
  HomeRepository(super.controller);

  Future<BaseResponse> getMyInfo() async {
    final res = await baseSendRequest(
      ApiUrl.urlGetMyInfo,
      RequestMethod.GET,
    );

    return BaseResponse.fromJson(res);
  }

  Future<BaseResponseListGeneric<AttendanceLog>> getMyLogs() async {
    final today = DateTime.now();
    final fromDate = today;
    final toDate = today;

    final queryParams = {
      'from': convertDateToStringDefault(fromDate),
      'to': convertDateToStringDefault(toDate),
    };

    final res = await baseSendRequest(
      ApiUrl.urlGetMyLogs,
      RequestMethod.GET,
      jsonMap: queryParams,
    );

    return BaseResponseListGeneric<AttendanceLog>.fromJson(
      res,
      func: (x) => AttendanceLog.fromJson(x),
    );
  }
}
