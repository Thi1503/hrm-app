part of 'register_leave_detail_page.dart';

extension RegisterLeaveDetailWidget on RegisterLeaveDetailPage {
  Widget _buildBody() {
    return Obx(() {
      final detail = controller.leaveDetail.value;
      if (detail == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Trạng thái:', _buildStatusChip(detail.status)),
            SizedBox(height: AppDimens.defaultPadding),
            _buildInfoRow(
                'Tạo bởi:', Text(controller.argument.employeeName ?? 'Tôi')),
            SizedBox(height: AppDimens.defaultPadding),
            if (controller.argument.departmentName != null &&
                controller.argument.departmentName!.isNotEmpty) ...[
              _buildInfoRow(
                  'Phòng ban:', Text(controller.argument.departmentName!)),
              SizedBox(height: AppDimens.defaultPadding),
            ],
            if (controller.argument.positionName != null &&
                controller.argument.positionName!.isNotEmpty) ...[
              _buildInfoRow(
                  'Chức vụ:', Text(controller.argument.positionName!)),
              SizedBox(height: AppDimens.defaultPadding),
            ],
            if (controller.argument.managerName != null &&
                controller.argument.managerName!.isNotEmpty) ...[
              _buildInfoRow(
                  'Người quản lý:', Text(controller.argument.managerName!)),
              SizedBox(height: AppDimens.defaultPadding),
            ],
            _buildInfoRow(
              'Nghỉ từ ngày:',
              Text(DateFormat('dd/MM/yyyy').format(detail.fromDate)),
            ),
            SizedBox(height: AppDimens.defaultPadding),
            _buildInfoRow(
              'Nghỉ đến ngày:',
              Text(DateFormat('dd/MM/yyyy').format(detail.toDate)),
            ),
            SizedBox(height: AppDimens.defaultPadding),
            _buildInfoRow(
              'Số ngày nghỉ:',
              Text(detail.totalDays.toString()),
            ),
            SizedBox(height: AppDimens.defaultPadding),
            _buildInfoRow(
              'Loại hình nghỉ:',
              Text(detail.leaveType.displayName),
            ),
            SizedBox(height: AppDimens.defaultPadding),
            _buildInfoRow(
              'Lý do:',
              Text(detail.reason),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildInfoRow(String label, Widget value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 180,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(child: value),
      ],
    );
  }

  Widget _buildStatusChip(RequestStatus status) {
    Color backgroundColor = _getStatusColor(status);
    String text = status.displayName;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: backgroundColor),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: backgroundColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getStatusColor(RequestStatus status) {
    if (status.isApproved) return Colors.green;
    if (status.isRejected) return Colors.red;
    if (status.isCancelled) return Colors.grey;
    if (status.isPendingManager) return Colors.orange;
    if (status.isPendingHR) return Colors.blue;
    return Colors.grey;
  }
}
