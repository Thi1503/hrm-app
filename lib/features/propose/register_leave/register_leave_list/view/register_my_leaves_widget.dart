part of 'register_leave_page.dart';

extension RegisterMyLeavesWidget on RegisterLeavePage {
  Widget buildLeaveList() {
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
            buildLeaveCard(filteredRequests[index]),
      );
    });
  }

  Widget buildLeaveCard(LeaveRequestItem item) {
    final statusColor = getStatusColor(item.status);
    final fromDate = convertDateToString(item.fromDate, PATTERN_1);
    final toDate = convertDateToString(item.toDate, PATTERN_1);

    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoute.routeRegisterLeaveDetail,
          arguments: RegisterLeaveDetailArgument(
            registerId: item.id,
          ),
        );
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
              'Xin nghỉ phép tháng ${item.fromDate.month}/${item.fromDate.year}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 10),
            buildInfoRow('Loại nghỉ:', item.leaveType.displayName),
            buildInfoRow('Từ ngày:', fromDate),
            buildInfoRow('Đến ngày:', toDate),
            buildInfoRow('Lý do:', item.reason),
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
}
