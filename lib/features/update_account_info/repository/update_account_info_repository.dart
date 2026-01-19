import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/api_url.dart';
import 'package:do_an_application/features/update_account_info/models/my_info_update_request.dart';

class UpdateAccountInfoRepository extends BaseRepository {
  UpdateAccountInfoRepository(super.controller);

  Future<BaseResponse> updateMyInfo(MyInfoUpdateRequest request) async {
    final res = await baseSendRequest(
      ApiUrl.urlUpdateMyInfo,
      RequestMethod.POST,
      jsonMap: request.toJson(),
    );

    return BaseResponse.fromJson(res);
  }
}
