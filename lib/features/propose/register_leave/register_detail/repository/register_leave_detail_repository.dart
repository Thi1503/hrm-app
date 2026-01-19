import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/api_url.dart';

class RegisterLeaveDetailRepository extends BaseRepository {
  RegisterLeaveDetailRepository(super.controller);

  Future<BaseResponse> getLeaveRequestDetail(int id) async {
    final res = await baseSendRequest(
      ApiUrl.urlGetLeaveRequestDetail(id),
      RequestMethod.GET,
    );

    return BaseResponse.fromJson(res);
  }
}
