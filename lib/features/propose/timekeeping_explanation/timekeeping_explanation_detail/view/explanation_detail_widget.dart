part of 'explanation_detail_page.dart';

extension ExplanationDetailWidget on ExplanationDetailPage {
  Widget _buildBody() {
    return Obx(() {
      final detail = controller.explanationDetail.value;
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
              'Ngày chấm công:',
              Text(DateFormat('dd/MM/yyyy').format(detail.workDate)),
            ),
            SizedBox(height: AppDimens.defaultPadding),
            _buildInfoRow(
              'Loại giải trình:',
              Text(detail.explanationType.displayName),
            ),
            SizedBox(height: AppDimens.defaultPadding),
            _buildInfoRow(
              'Lý do:',
              Text(detail.reason),
            ),
            SizedBox(height: AppDimens.defaultPadding),
            // _buildInfoRow(
            //   'Ngày tạo:',
            //   Text(DateFormat('dd/MM/yyyy HH:mm').format(detail.createdAt)),
            // ),
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
        title: const Text('Từ chối đơn giải trình'),
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
          ElevatedButton(
            onPressed: () {
              if (reasonController.text.trim().isEmpty) {
                controller.showSnackBar('Vui lòng nhập lý do từ chối');
                return;
              }
              Get.back();
              controller.rejectExplanation(reasonController.text.trim());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Từ chối'),
          ),
        ],
      ),
    );
  }
}
