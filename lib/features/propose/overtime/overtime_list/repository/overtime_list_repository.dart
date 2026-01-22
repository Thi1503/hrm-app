import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/api_url.dart';
import 'package:do_an_application/features/propose/overtime/overtime_list/models/ot_request_hr_item.dart';
import 'package:do_an_application/features/propose/overtime/overtime_list/models/ot_request_item.dart';
import 'package:do_an_application/features/propose/overtime/overtime_list/models/ot_request_manager_item.dart';

class OvertimeListRepository extends BaseRepository {
  OvertimeListRepository(super.controller);

  Future<BaseResponseListGeneric<OtRequestItem>> getMyRequests() async {
    final res = await baseSendRequest(
      ApiUrl.urlGetMyOtRequests,
      RequestMethod.GET,
    );

    return BaseResponseListGeneric<OtRequestItem>.fromJson(
      res,
      func: (x) => OtRequestItem.fromJson(x),
    );
  }

  Future<BaseResponseListGeneric<OtRequestManagerItem>>
      getManagerRequests() async {
    final res = await baseSendRequest(
      ApiUrl.urlGetManagerOtRequests,
      RequestMethod.GET,
    );

    return BaseResponseListGeneric<OtRequestManagerItem>.fromJson(
      res,
      func: (x) => OtRequestManagerItem.fromJson(x),
    );
  }

  Future<BaseResponseListGeneric<OtRequestHrItem>> getHrRequests() async {
    final res = await baseSendRequest(
      ApiUrl.urlGetHrOtRequests,
      RequestMethod.GET,
    );

    return BaseResponseListGeneric<OtRequestHrItem>.fromJson(
      res,
      func: (x) => OtRequestHrItem.fromJson(x),
    );
  }
}
