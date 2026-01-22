import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/api_url.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_form/models/create_explanation_request.dart';

class TimekeepingExplanationFormRepository extends BaseRepository {
  TimekeepingExplanationFormRepository(super.controller);

  Future<BaseResponse> createExplanation(
      CreateExplanationRequest request) async {
    final res = await baseSendRequest(
      ApiUrl.urlCreateExplanation,
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
