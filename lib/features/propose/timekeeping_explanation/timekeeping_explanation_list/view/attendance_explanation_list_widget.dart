part of 'attendance_explanation_list_page.dart';

extension AttendanceExplanationListWidget on AttendanceExplanationListPage {
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text(
        'Giải trình chấm công',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
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

  // 2. Bộ lọc
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
                        controller.updateStatusFilter(value);
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
        final result =
            await Get.toNamed(AppRoute.routeTimekeepingExplanationForm);
        if (result == true) {
          controller.fetchMyExplanations();
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

  // 3. TAB CỦA TÔI: Hiển thị danh sách từ controller
  Widget _buildExplanationList() {
    return Obx(() {
      final filteredExplanations = controller.filteredExplanations;

      if (filteredExplanations.isEmpty) {
        return const Center(
          child: Text(
            'Không có đơn giải trình nào',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filteredExplanations.length,
        itemBuilder: (context, index) =>
            _buildExplanationCard(filteredExplanations[index]),
      );
    });
  }

  // 4. TAB TÔI DUYỆT: Hiển thị danh sách từ controller
  Widget _buildApproverList() {
    return Obx(() {
      // Hiển thị danh sách manager nếu không phải HR/Admin
      if (!controller.isHRorAdmin) {
        return _buildManagerExplanationList();
      }
      // Hiển thị danh sách HR nếu là HR/Admin
      return _buildHrExplanationList();
    });
  }

  Widget _buildManagerExplanationList() {
    final filteredExplanations = controller.filteredManagerExplanations;

    if (filteredExplanations.isEmpty) {
      return const Center(
        child: Text(
          'Không có đơn giải trình nào',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: filteredExplanations.length,
      itemBuilder: (context, index) =>
          _buildManagerExplanationCard(filteredExplanations[index]),
    );
  }

  Widget _buildHrExplanationList() {
    final filteredExplanations = controller.filteredHrExplanations;

    if (filteredExplanations.isEmpty) {
      return const Center(
        child: Text(
          'Không có đơn giải trình nào',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: filteredExplanations.length,
      itemBuilder: (context, index) =>
          _buildHrExplanationCard(filteredExplanations[index]),
    );
  }

  Widget _buildManagerExplanationCard(ExplanationManagerItem item) {
    final statusColor = _getStatusColor(item.status);
    final workDate = convertDateToString(item.workDate, PATTERN_1);

    return InkWell(
      onTap: () {
        // TODO: Navigate to detail page
      },
      child: Container(
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
              'Giải trình tháng ${item.workDate.month}/${item.workDate.year}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 10),
            _buildInfoRow('Nhân viên:', item.employeeName),
            _buildInfoRow('Ngày chấm công:', workDate),
            _buildInfoRow('Loại giải trình:', item.explanationType.displayName),
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
      ),
    );
  }

  Widget _buildHrExplanationCard(ExplanationHrItem item) {
    final statusColor = _getStatusColor(item.status);
    final workDate = convertDateToString(item.workDate, PATTERN_1);

    return InkWell(
      onTap: () {
        // TODO: Navigate to detail page
      },
      child: Container(
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
              'Giải trình tháng ${item.workDate.month}/${item.workDate.year}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 10),
            _buildInfoRow('Nhân viên:', item.employeeName),
            _buildInfoRow('Phòng ban:', item.departmentName),
            _buildInfoRow('Ngày chấm công:', workDate),
            _buildInfoRow('Loại giải trình:', item.explanationType.displayName),
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
      ),
    );
  }

  // 5. Widget Card hiển thị đơn giải trình
  Widget _buildExplanationCard(AttendanceExplanationItem item) {
    final statusColor = _getStatusColor(item.status);
    final workDate = convertDateToString(item.workDate, PATTERN_1);

    return InkWell(
      onTap: () {
        // TODO: Navigate to detail page
        // showSnackBar('Chi tiết đơn giải trình #${item.id}');
      },
      child: Container(
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
              'Giải trình tháng ${item.workDate.month}/${item.workDate.year}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 10),
            _buildInfoRow('Ngày chấm công:', workDate),
            _buildInfoRow('Loại giải trình:', item.explanationType.displayName),
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
      ),
    );
  }

  // 6. Widget dòng thông tin chi tiết
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  // Helper: Lấy màu theo trạng thái
  Color _getStatusColor(RequestStatus status) {
    if (status.isPendingManager) return Colors.orange;
    if (status.isPendingHR) return Colors.blue;
    if (status.isApproved) return Colors.green;
    if (status.isRejected) return Colors.red;
    if (status.isCancelled) return Colors.grey;
    return Colors.grey;
  }
}
