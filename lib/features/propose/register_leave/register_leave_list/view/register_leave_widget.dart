part of 'register_leave_page.dart';

extension RegisterLeaveWidget on RegisterLeavePage {
// 1. Build AppBar đồng bộ hoàn toàn về Font và Màu sắc
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,

      // Giữ lại nút Back màu trắng như bạn đã yêu cầu ở bước trước
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(color: Colors.white),

      title: const Text(
        'Đăng ký nghỉ',
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

      // Giữ TabBar ở phía dưới cho trang Đăng ký nghỉ
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

  // 2. Bộ lọc trạng thái và các nút chức năng
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
                        controller.updateStatusFilter(value);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          _buildActionButton(
            icon: Icons.add,
            onTap: () => Get.toNamed(AppRoute.routeRegisterLeaveForm),
            color: Color(0xFFF97316),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildLeaveList() {
    return Obx(() {
      final filteredRequests = controller.filteredRequests;

      if (filteredRequests.isEmpty) {
        return const Center(
          child: Text(
            'Không có đơn nghỉ phép nào',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filteredRequests.length,
        itemBuilder: (context, index) =>
            _buildLeaveCard(filteredRequests[index]),
      );
    });
  }

  Widget _buildLeaveCard(LeaveRequestItem item) {
    final statusColor = _getStatusColor(item.status);
    final fromDate = convertDateToString(item.fromDate, PATTERN_1);
    final toDate = convertDateToString(item.toDate, PATTERN_1);

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
            'Xin nghỉ phép tháng ${item.fromDate.month}/${item.fromDate.year}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 10),
          _buildInfoRow('Loại nghỉ:', item.leaveType.displayName),
          _buildInfoRow('Từ ngày:', fromDate),
          _buildInfoRow('Đến ngày:', toDate),
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

  Color _getStatusColor(RequestStatus status) {
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
              child:
                  Text(label, style: const TextStyle(color: Colors.black54))),
          Expanded(
              child: Text(value,
                  style: const TextStyle(fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}
