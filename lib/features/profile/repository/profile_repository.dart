import 'package:do_an_application/base/repositories/base_repository.dart';
import 'package:do_an_application/base/requests/base_request.dart';
import 'package:do_an_application/base/responses/base_response.dart';
import 'package:do_an_application/const/api_url.dart';

class ProfileRepository extends BaseRepository {
  ProfileRepository(super.controller);

  Future<BaseResponse> getMyInfo() async {
    final res = await baseSendRequest(
      ApiUrl.urlGetMyInfo,
      RequestMethod.GET,
    );

    return BaseResponse.fromJson(res);
  }
}
