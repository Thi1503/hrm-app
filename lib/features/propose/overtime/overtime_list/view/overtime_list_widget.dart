part of 'overtime_list_page.dart';

extension OvertimeListWidget on OvertimeListPage {
  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text(
        'Làm thêm giờ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.colorHeadPayroll,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      bottom: const TabBar(
        indicatorColor: Colors.yellow,
        indicatorWeight: 3,
        labelColor: Colors.yellow,
        unselectedLabelColor: Colors.white,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        tabs: [
          Tab(text: 'Của tôi'),
          Tab(text: 'Tôi duyệt'),
        ],
      ),
    );
  }

  Widget _buildFilterHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const Text('Trạng thái: ', style: TextStyle(color: Colors.black54)),
          Expanded(
            child: Obx(
              () => Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: controller.selectedStatus.value,
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.orange),
                    items: [
                      'Tất cả',
                      'Chờ quản lý duyệt',
                      'Chờ nhân sự duyệt',
                      'Đã duyệt',
                      'Từ chối',
                      'Đã hủy'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                            Text(value, style: const TextStyle(fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        controller.setStatusFilter(value);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          _buildCircleButton(Icons.add),
        ],
      ),
    );
  }

  Widget _buildCircleButton(IconData icon) {
    return InkWell(
      onTap: () async {
        final result = await Get.toNamed(AppRoute.routeOverTimeForm);
        if (result == true) {
          controller.fetchOtRequests();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Color(0xFFF97316),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildOvertimeList() {
    return Obx(() {
      final filteredRequests = controller.filteredRequests;

      if (filteredRequests.isEmpty) {
        return const Center(
          child: Text(
            'Không có đơn OT nào',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        );
      }

      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filteredRequests.length,
        itemBuilder: (context, index) =>
            _buildOvertimeCard(filteredRequests[index]),
        separatorBuilder: (context, index) => sdsSBHeight12,
      );
    });
  }

  Widget _buildOvertimeCard(dynamic item) {
    final statusColor = _getStatusColor(item.status);
    final otDate = convertDateToString(item.otDate, PATTERN_1);
    final startHour =
        '${item.startTime.hour.toString().padLeft(2, '0')}:${item.startTime.minute.toString().padLeft(2, '0')}';
    final endHour =
        '${item.endTime.hour.toString().padLeft(2, '0')}:${item.endTime.minute.toString().padLeft(2, '0')}';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Làm thêm giờ tháng ${item.otDate.month}/${item.otDate.year}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 10),
          _buildInfoRow('Ngày OT:', otDate),
          _buildInfoRow('Giờ bắt đầu:', startHour),
          _buildInfoRow('Giờ kết thúc:', endHour),
          _buildInfoRow('Tổng số giờ:', '${item.totalHours} giờ'),
          _buildInfoRow('Lý do:', item.reason),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.circle, color: statusColor, size: 10),
              const SizedBox(width: 6),
              Text(
                item.status.displayName,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(dynamic status) {
    if (status.isApproved) return Colors.green;
    if (status.isRejected) return Colors.red;
    if (status.isCancelled) return Colors.grey;
    if (status.isPendingManager) return Colors.orange;
    if (status.isPendingHR) return Colors.blue;
    return Colors.grey;
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Tab "Tôi duyệt"
  Widget _buildApprovalList() {
    return Obx(() {
      if (controller.isHRorAdmin) {
        return _buildHrOtList();
      } else {
        return _buildManagerOtList();
      }
    });
  }

  Widget _buildManagerOtList() {
    return Obx(() {
      final filteredRequests = controller.filteredManagerRequests;

      if (filteredRequests.isEmpty) {
        return const Center(
          child: Text(
            'Không có đơn OT nào cần duyệt',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        );
      }

      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filteredRequests.length,
        itemBuilder: (context, index) =>
            _buildManagerOtCard(filteredRequests[index]),
        separatorBuilder: (context, index) => sdsSBHeight12,
      );
    });
  }

  Widget _buildManagerOtCard(dynamic item) {
    final statusColor = _getStatusColor(item.status);
    final otDate = convertDateToString(item.otDate, PATTERN_1);
    final startHour =
        '${item.startTime.hour.toString().padLeft(2, '0')}:${item.startTime.minute.toString().padLeft(2, '0')}';
    final endHour =
        '${item.endTime.hour.toString().padLeft(2, '0')}:${item.endTime.minute.toString().padLeft(2, '0')}';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Làm thêm giờ tháng ${item.otDate.month}/${item.otDate.year}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 10),
          _buildInfoRow('Nhân viên:', item.employeeName),
          _buildInfoRow('Ngày OT:', otDate),
          _buildInfoRow('Giờ bắt đầu:', startHour),
          _buildInfoRow('Giờ kết thúc:', endHour),
          _buildInfoRow('Lý do:', item.reason),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.circle, color: statusColor, size: 10),
              const SizedBox(width: 6),
              Text(
                item.status.displayName,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHrOtList() {
    return Obx(() {
      final filteredRequests = controller.filteredHrRequests;

      if (filteredRequests.isEmpty) {
        return const Center(
          child: Text(
            'Không có đơn OT nào cần duyệt',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        );
      }

      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filteredRequests.length,
        itemBuilder: (context, index) =>
            _buildHrOtCard(filteredRequests[index]),
        separatorBuilder: (context, index) => sdsSBHeight12,
      );
    });
  }

  Widget _buildHrOtCard(dynamic item) {
    final statusColor = _getStatusColor(item.status);
    final otDate = convertDateToString(item.otDate, PATTERN_1);
    final startHour =
        '${item.startTime.hour.toString().padLeft(2, '0')}:${item.startTime.minute.toString().padLeft(2, '0')}';
    final endHour =
        '${item.endTime.hour.toString().padLeft(2, '0')}:${item.endTime.minute.toString().padLeft(2, '0')}';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Làm thêm giờ tháng ${item.otDate.month}/${item.otDate.year}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 10),
          _buildInfoRow('Nhân viên:', item.employeeName),
          _buildInfoRow('Phòng ban:', item.departmentName),
          _buildInfoRow('Chức vụ:', item.positionName),
          _buildInfoRow('Quản lý:', item.managerName),
          _buildInfoRow('Ngày OT:', otDate),
          _buildInfoRow('Giờ bắt đầu:', startHour),
          _buildInfoRow('Giờ kết thúc:', endHour),
          _buildInfoRow('Lý do:', item.reason),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.circle, color: statusColor, size: 10),
              const SizedBox(width: 6),
              Text(
                item.status.displayName,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
