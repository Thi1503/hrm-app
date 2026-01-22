import 'package:do_an_application/base/repositories/base_repository.dart';
import 'package:do_an_application/base/requests/base_request.dart';
import 'package:do_an_application/base/responses/base_response_list_generic.dart';
import 'package:do_an_application/const/api_url.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/models/attendance_explantation_item.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/models/explanation_manager_item.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/models/explanation_hr_item.dart';

class AttendanceExplantationRepository extends BaseRepository {
  AttendanceExplantationRepository(super.controller);

  Future<BaseResponseListGeneric<AttendanceExplanationItem>>
      getMyRequests() async {
    final res = await baseSendRequest(
      ApiUrl.urlGetMyExplanations,
      RequestMethod.GET,
    );

    return BaseResponseListGeneric<AttendanceExplanationItem>.fromJson(
      res,
      func: (x) => AttendanceExplanationItem.fromJson(x),
    );
  }

  Future<BaseResponseListGeneric<ExplanationManagerItem>>
      getManagerRequests() async {
    final res = await baseSendRequest(
      ApiUrl.urlGetManagerExplanations,
      RequestMethod.GET,
    );

    return BaseResponseListGeneric<ExplanationManagerItem>.fromJson(
      res,
      func: (x) => ExplanationManagerItem.fromJson(x),
    );
  }

  Future<BaseResponseListGeneric<ExplanationHrItem>> getHrRequests() async {
    final res = await baseSendRequest(
      ApiUrl.urlGetHrExplanations,
      RequestMethod.GET,
    );

    return BaseResponseListGeneric<ExplanationHrItem>.fromJson(
      res,
      func: (x) => ExplanationHrItem.fromJson(x),
    );
  }
}
