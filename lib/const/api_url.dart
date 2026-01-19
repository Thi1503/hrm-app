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
}
