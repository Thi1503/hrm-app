class OvertimeDetailArgument {
  final int otId;
  final bool isFromManagerListPage;
  final bool isFromHrListPage;

  OvertimeDetailArgument({
    required this.otId,
    this.isFromManagerListPage = false,
    this.isFromHrListPage = false,
  });
}
