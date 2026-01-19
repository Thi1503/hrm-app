class ApiUrl {
  const ApiUrl._();

  // Identity Service
  static const String urlLogin = '/identity/auth/login';

  //Employee Service
  static const String urlGetMyInfo = '/employee/employees/my-info';
  static const String urlUpdateMyInfo = '/employee/employees/update-my-info';

  // Attendance Service
  static const String urlGetMyLogs = '/attendance/attendance/my-logs';
}
