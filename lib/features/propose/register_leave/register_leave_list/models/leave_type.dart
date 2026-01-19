enum LeaveType {
  annual('ANNUAL', 'Nghỉ phép năm'),
  unpaid('UNPAID', 'Nghỉ không lương'),
  sick('SICK', 'Nghỉ ốm'),
  other('OTHER', 'Khác');

  final String value;
  final String displayName;

  const LeaveType(this.value, this.displayName);

  static LeaveType fromValue(String? value) {
    if (value == null) return LeaveType.other;

    try {
      return LeaveType.values.firstWhere(
        (e) => e.value.toUpperCase() == value.toUpperCase(),
      );
    } catch (_) {
      return LeaveType.other;
    }
  }

  bool get isAnnual => this == LeaveType.annual;
  bool get isUnpaid => this == LeaveType.unpaid;
  bool get isSick => this == LeaveType.sick;
  bool get isOther => this == LeaveType.other;
}
