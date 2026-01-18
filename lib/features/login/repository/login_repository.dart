import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/api_url.dart';
import 'package:do_an_application/features/login/models/login_request.dart';

class LoginRepository extends BaseRepository {
  LoginRepository(super.controller);

  Future<BaseResponse> login(
    LoginRequest request,
  ) async {
    final res = await baseSendRequest(
      ApiUrl.urlLogin,
      RequestMethod.POST,
      jsonMap: request.toJson(),
      functionError: (error) {
        // Ném lỗi lên để controller xử lý
        throw error;
      },
    );

    if (res == null) {
      throw Exception('Response is null');
    }

    return BaseResponse.fromJson(res);
  }
}
