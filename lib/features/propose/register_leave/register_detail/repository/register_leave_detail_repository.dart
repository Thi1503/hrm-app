import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/api_url.dart';
import 'package:do_an_application/features/propose/models/reject_request.dart';
import 'package:do_an_application/features/propose/models/approval_request.dart';

class RegisterLeaveDetailRepository extends BaseRepository {
  RegisterLeaveDetailRepository(super.controller);

  Future<BaseResponse> getLeaveRequestDetail(int id) async {
    final res = await baseSendRequest(
      ApiUrl.urlGetLeaveRequestDetail(id),
      RequestMethod.GET,
    );

    return BaseResponse.fromJson(res);
  }

  Future<BaseResponse> rejectLeaveRequest(
      RejectRequest rejectLeaveRequest) async {
    final res = await baseSendRequest(
      ApiUrl.urlRejectRequest,
      RequestMethod.POST,
      jsonMap: rejectLeaveRequest.toJson(),
    );

    return BaseResponse.fromJson(res);
  }

  Future<BaseResponse> approveLeaveRequest({
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
