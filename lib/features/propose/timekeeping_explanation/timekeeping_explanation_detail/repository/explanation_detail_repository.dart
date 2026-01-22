import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/api_url.dart';
import 'package:do_an_application/features/propose/models/reject_request.dart';
import 'package:do_an_application/features/propose/models/approval_request.dart';

class ExplanationDetailRepository extends BaseRepository {
  ExplanationDetailRepository(super.controller);

  Future<BaseResponse> getExplanationDetail(int id) async {
    final res = await baseSendRequest(
      ApiUrl.urlGetExplanationDetail(id),
      RequestMethod.GET,
    );

    return BaseResponse.fromJson(res);
  }

  Future<BaseResponse> rejectExplanation(RejectRequest rejectRequest) async {
    final res = await baseSendRequest(
      ApiUrl.urlRejectRequest,
      RequestMethod.POST,
      jsonMap: rejectRequest.toJson(),
    );

    return BaseResponse.fromJson(res);
  }

  Future<BaseResponse> approveExplanation({
    required ApprovalRequest approvalRequest,
    required bool isHr,
  }) async {
    final res = await baseSendRequest(
      isHr ? ApiUrl.urlHrApproveRequest : ApiUrl.urlManagerApproveRequest,
      RequestMethod.POST,
      jsonMap: approvalRequest.toJson(),
    );

    return BaseResponse.fromJson(res);
  }
}
