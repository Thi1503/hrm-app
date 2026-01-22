import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/api_url.dart';
import 'package:do_an_application/features/propose/overtime/overtime_form/models/create_ot_request.dart';

class OvertimeFormRepository extends BaseRepository {
  OvertimeFormRepository(super.controller);

  Future<BaseResponse> createOtRequest(CreateOtRequest request) async {
    final res = await baseSendRequest(
      ApiUrl.urlCreateOtRequest,
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
