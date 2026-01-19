import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/api_url.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/models/leave_request_item.dart';

class RegisterLeaveListRepository extends BaseRepository {
  RegisterLeaveListRepository(super.controller);

  Future<BaseResponseListGeneric<LeaveRequestItem>> getMyRequests() async {
    final res = await baseSendRequest(
      ApiUrl.urlGetMyRequests,
      RequestMethod.GET,
    );

    return BaseResponseListGeneric<LeaveRequestItem>.fromJson(
      res,
      func: (x) => LeaveRequestItem.fromJson(x),
    );
  }
}
