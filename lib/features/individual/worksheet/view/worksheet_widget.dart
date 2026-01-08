part of 'worksheet_page.dart';

extension WorksheetWidget on WorksheetPage {
  Widget _buildMonthSelector() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    controller.monthYearDisplay,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(
                  Icons.calendar_today,
                  color: Colors.orange,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        TextButton(
          onPressed: controller.onSelectMonth,
          child: const Text(
            'Chọn tháng',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

// 2. Danh sách thẻ xếp dọc với bộ Icon dễ hình dung
  Widget _buildSummaryGrid() {
    return Column(
      children: [
        _buildSummaryItem(
          value: controller.totalStandardWork.value,
          label: 'Tổng công',
          color: Colors.green,
          icon: Icons.assignment_ind_rounded,
        ),
        _buildSummaryItem(
          value: controller.totalLateMinutes.value,
          label: 'Tổng phút đi muộn',
          color: Colors.orange,
          icon: Icons.running_with_errors_rounded,
        ),
        _buildSummaryItem(
          value: controller.totalEarlyMinutes.value,
          label: 'Tổng phút về sớm',
          color: Colors.deepOrange,
          icon: Icons.directions_walk_rounded,
        ),
        _buildSummaryItem(
          value: controller.totalOTHours.value,
          label: 'Tổng giờ OT',
          color: Colors.cyan,
          icon: Icons.add_alarm_rounded,
        ),
        _buildSummaryItem(
          value: controller.totalLeaveDays.value,
          label: 'Tổng ngày nghỉ',
          color: Colors.purple,
          icon: Icons.no_accounts_rounded,
        ),
      ],
    );
  }

  // 3. Thiết kế thẻ ngang hiện đại (Đã fix font chữ giá trị)
  Widget _buildSummaryItem({
    required String value,
    required String label,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon đại diện bo tròn trẻ trung
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          // Tiêu đề
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                ),
                sdsSBHeight4,
                const Text(
                  'Xem chi tiết',
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
