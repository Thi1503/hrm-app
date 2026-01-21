import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/api_url.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/models/leave_request_hr_item.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/models/leave_request_item.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/models/leave_request_manager_item.dart';

class RegisterLeaveListRepository extends BaseRepository {
  RegisterLeaveListRepository(super.controller);

  Future<BaseResponseListGeneric<LeaveRequestItem>> getMyRequests() async {
    final res = await baseSendRequest(
      ApiUrl.urlGetMyLeaveRequests,
      RequestMethod.GET,
    );

    return BaseResponseListGeneric<LeaveRequestItem>.fromJson(
      res,
      func: (x) => LeaveRequestItem.fromJson(x),
    );
  }

  Future<BaseResponseListGeneric<LeaveRequestManagerItem>>
      getManagerRequests() async {
    final res = await baseSendRequest(
      ApiUrl.urlGetManagerLeaveRequests,
      RequestMethod.GET,
    );

    return BaseResponseListGeneric<LeaveRequestManagerItem>.fromJson(
      res,
      func: (x) => LeaveRequestManagerItem.fromJson(x),
    );
  }

  Future<BaseResponseListGeneric<LeaveRequestHrItem>> getHrRequests() async {
    final res = await baseSendRequest(
      ApiUrl.urlGetHrLeaveRequests,
      RequestMethod.GET,
    );

    return BaseResponseListGeneric<LeaveRequestHrItem>.fromJson(
      res,
      func: (x) => LeaveRequestHrItem.fromJson(x),
    );
  }
}
