class ApiUrl {
  const ApiUrl._();

  // Identity Service
  static const String urlLogin = '/identity/auth/login';

  //Employee Service
  static const String urlGetMyInfo = '/employee/employees/my-info';
  static const String urlUpdateMyInfo = '/employee/employees/update-my-info';

  // Attendance Service
  static const String urlGetMyLogs = '/attendance/attendance/my-logs';

  // Request Approval Service
  static const String urlRejectRequest = '/request-approval/approvals/reject';
  static const String urlManagerApproveRequest =
      '/request-approval/approvals/manager/approve';
  static const String urlHrApproveRequest =
      '/request-approval/approvals/hr/approve';

  static const String urlGetMyLeaveRequests =
      '/request-approval/leave-requests/list';
  static const String urlGetManagerLeaveRequests =
      '/request-approval/approvals/manager/leaves';
  static const String urlGetHrLeaveRequests =
      '/request-approval/approvals/hr/leaves';
  static String urlGetLeaveRequestDetail(int id) =>
      '/request-approval/leave-requests/detail/$id';
  static const String urlCreateLeaveRequest =
      '/request-approval/leave-requests/create';

  static const String urlGetMyExplanations =
      '/request-approval/attendance-explanations/list';
  static const String urlGetManagerExplanations =
      '/request-approval/approvals/manager/explanations';
  static const String urlGetHrExplanations =
      '/request-approval/approvals/hr/explanations';
  static String urlGetExplanationDetail(int id) =>
      '/request-approval/attendance-explanations/detail/$id';
  static const String urlCreateExplanation =
      '/request-approval/attendance-explanations/create';
}
