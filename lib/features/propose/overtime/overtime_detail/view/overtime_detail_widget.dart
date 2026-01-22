part of 'overtime_detail_page.dart';

extension OvertimeDetailWidget on OvertimeDetailPage {
  Widget _buildBody() {
    return Obx(() {
      final detail = controller.otDetail.value;
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
            _buildInfoRow('Nhân viên:', Text(detail.employeeName)),
            SizedBox(height: AppDimens.defaultPadding),
            _buildInfoRow(
              'Ngày OT:',
              Text(DateFormat('dd/MM/yyyy')
                  .format(DateTime.parse(detail.otDate))),
            ),
            SizedBox(height: AppDimens.defaultPadding),
            _buildInfoRow(
              'Giờ bắt đầu:',
              Text(detail.startTime),
            ),
            SizedBox(height: AppDimens.defaultPadding),
            _buildInfoRow(
              'Giờ kết thúc:',
              Text(detail.endTime),
            ),
            SizedBox(height: AppDimens.defaultPadding),
            _buildInfoRow(
              'Tổng số giờ:',
              Text('${detail.totalHours} giờ'),
            ),
            SizedBox(height: AppDimens.defaultPadding),
            _buildInfoRow(
              'Lý do:',
              Text(detail.reason),
            ),
            if (detail.managerComment != null &&
                detail.managerComment!.isNotEmpty) ...[
              SizedBox(height: AppDimens.defaultPadding),
              _buildInfoRow(
                'Nhận xét của Manager:',
                Text(detail.managerComment!),
              ),
            ],
            if (detail.hrComment != null && detail.hrComment!.isNotEmpty) ...[
              SizedBox(height: AppDimens.defaultPadding),
              _buildInfoRow(
                'Nhận xét của HR:',
                Text(detail.hrComment!),
              ),
            ],
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

  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5))
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildButton(
              'Từ chối',
              Colors.red,
              () => _showRejectDialog(),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildButton(
              'Phê duyệt',
              Colors.blue,
              () => controller.showApproveDialog(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    String text,
    Color color,
    VoidCallback onTap,
  ) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12),
        elevation: 0,
      ),
      child: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
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

  void _showRejectDialog() {
    final reasonController = TextEditingController();
    Get.dialog(
      AlertDialog(
        title: const Text('Từ chối đơn OT'),
        content: SizedBox(
          width: 400,
          child: TextField(
            controller: reasonController,
            decoration: const InputDecoration(
              hintText: 'Nhập lý do từ chối',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            maxLines: 3,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              if (reasonController.text.trim().isEmpty) {
                controller.showSnackBar('Vui lòng nhập lý do từ chối');
                return;
              }
              Get.back();
              controller.rejectOtRequest(reasonController.text.trim());
            },
            child: const Text('Xác nhận'),
          ),
        ],
      ),
    );
  }
}
