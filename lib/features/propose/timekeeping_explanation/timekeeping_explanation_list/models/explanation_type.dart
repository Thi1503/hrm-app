enum ExplanationType {
  lateArrival('LATE', 'Đi trễ'),
  earlyLeave('EARLY', 'Về sớm'),
  absent('ABSENT', 'Lỗi chấm công');

  final String value;
  final String displayName;

  const ExplanationType(this.value, this.displayName);

  static ExplanationType fromValue(String? value) {
    if (value == null) return ExplanationType.lateArrival;

    try {
      return ExplanationType.values.firstWhere(
        (e) => e.value.toUpperCase() == value.toUpperCase(),
      );
    } catch (_) {
      return ExplanationType.lateArrival;
    }
  }

  bool get isLateArrival => this == ExplanationType.lateArrival;
  bool get isEarlyLeave => this == ExplanationType.earlyLeave;
  bool get isAbsent => this == ExplanationType.absent;
}
