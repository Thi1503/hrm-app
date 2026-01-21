import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/api_url.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_form/models/register_leave_request.dart';

class RegisterLeaveFormRepository extends BaseRepository {
  RegisterLeaveFormRepository(super.controller);

  Future<BaseResponse> createLeaveRequest(
      RegisterLeaveRequest request) async {
    final res = await baseSendRequest(
      ApiUrl.urlCreateLeaveRequest,
      RequestMethod.POST,
      jsonMap: request.toJson(),
      functionError: (error) {
        throw error;
      },
    );

    if (res == null) {
      throw Exception('Response is null');
    }

    return BaseResponse.fromJson(res);
  }
}
