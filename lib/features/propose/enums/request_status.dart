enum RequestStatus {
  pendingManager('PENDING_MANAGER', 'Chờ quản lý duyệt'),
  pendingHR('PENDING_HR', 'Chờ HR duyệt'),
  approved('APPROVED', 'Đã duyệt'),
  rejected('REJECTED', 'Từ chối'),
  cancelled('CANCLE', 'Đã hủy');

  final String value;
  final String displayName;

  const RequestStatus(this.value, this.displayName);

  static RequestStatus fromValue(String? value) {
    if (value == null) return RequestStatus.pendingManager;

    try {
      return RequestStatus.values.firstWhere(
        (e) => e.value.toUpperCase() == value.toUpperCase(),
      );
    } catch (_) {
      return RequestStatus.pendingManager;
    }
  }

  bool get isPendingManager => this == RequestStatus.pendingManager;
  bool get isPendingHR => this == RequestStatus.pendingHR;
  bool get isApproved => this == RequestStatus.approved;
  bool get isRejected => this == RequestStatus.rejected;
  bool get isCancelled => this == RequestStatus.cancelled;

  bool get isPending => isPendingManager || isPendingHR;
}
