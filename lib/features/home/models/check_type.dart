enum CheckType {
  checkIn('IN', 'Vào ca'),
  checkOut('OUT', 'Ra ca');

  final String value;
  final String displayName;

  const CheckType(this.value, this.displayName);

  static CheckType fromValue(String? value) {
    if (value == null) return CheckType.checkIn;

    try {
      return CheckType.values.firstWhere(
        (e) => e.value.toUpperCase() == value.toUpperCase(),
      );
    } catch (_) {
      return CheckType.checkIn;
    }
  }

  bool get isCheckIn => this == CheckType.checkIn;
  bool get isCheckOut => this == CheckType.checkOut;
}
