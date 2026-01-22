class ExplanationDetailArgument {
  final int requestId;
  final bool isFromManagerListPage;
  final bool isFromHrListPage;
  final String? employeeName;
  final String? departmentName;
  final String? positionName;
  final String? managerName;

  ExplanationDetailArgument({
    required this.requestId,
    this.employeeName,
    this.departmentName,
    this.positionName,
    this.managerName,
    this.isFromManagerListPage = false,
    this.isFromHrListPage = false,
  });
}
