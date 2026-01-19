class RegisterLeaveDetailArgument {
  final int registerId;
  final bool isFromManagerListPage;
  final bool isFromHrListPage;
  final String? employeeName;
  final String? departmentName;
  final String? positionName;
  final String? managerName;

  RegisterLeaveDetailArgument({
    required this.registerId,
    this.employeeName,
    this.departmentName,
    this.positionName,
    this.managerName,
    this.isFromManagerListPage = false,
    this.isFromHrListPage = false,
  });
}
