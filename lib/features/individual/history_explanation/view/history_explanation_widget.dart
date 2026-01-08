part of 'history_explanation_page.dart';

extension HistoryExplanationWidget on HistoryExplanationPage {
  Widget _buildFilters() {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.defaultPadding),
      child: Column(
        children: [
          _buildFilterRow('Tháng lương', 'Tháng 01/2026'),
          sdsSBHeight8,
        ],
      ),
    );
  }

  Widget _buildFilterRow(
    String label,
    String value,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: controller.onSelectMonth,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.gray7,
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
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() => TableCalendar(
            firstDay: DateTime.utc(2025, 1, 1),
            lastDay: DateTime.utc(2026, 12, 31),
            focusedDay: controller.focusedDay.value,
            selectedDayPredicate: (day) =>
                isSameDay(controller.selectedDay.value, day),
            headerVisible: false,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekHeight: 30,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              selectedDecoration: const BoxDecoration(
                  color: Colors.orange, shape: BoxShape.circle),
              todayDecoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.3),
                  shape: BoxShape.circle),
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (date.day == 1) return _buildDot(Colors.red);
                if (date.day == 2) return _buildDot(Colors.yellow);
                if (date.day == 5) return _buildDot(Colors.green);
                if (date.day == 6) return _buildDot(Colors.orange);
                if (date.day == 7) return _buildDot(Colors.red);
                return const SizedBox();
              },
            ),
            onDaySelected: (selected, focused) =>
                controller.onDaySelected(selected, focused),
          )),
    );
  }

  Widget _buildDot(Color color) {
    return Positioned(
      bottom: 6,
      child: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }

  Widget _buildSummaryBadges() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          _buildBadge('Số công 2/24', const Color(0xFF4CAF50)),
          const SizedBox(width: 8),
          _buildBadge('Đi muộn 1', const Color(0xFFF97316)),
          const SizedBox(width: 8),
          _buildBadge('Nghỉ 2', const Color(0xFFEF4444)),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13)),
      ),
    );
  }

  // 5. Action Headers
  Widget _buildActionHeaders() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.history, color: Colors.orange, size: 20),
              SizedBox(width: 8),
              Text('Lịch sử chấm công',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ],
          ),
          Row(
            children: [
              const Text('Giải trình',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(width: 4),
              Icon(Icons.add_circle_outline, color: Colors.orange.shade800),
            ],
          ),
        ],
      ),
    );
  }

  // 6. Các khối trạng thái chi tiết bên dưới
  Widget _buildStatusDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildStatusBox(
              'Bạn chưa\ncheckin', const Color(0xFF4CAF50), Icons.access_time),
          const SizedBox(width: 8),
          _buildStatusBox(
              'Bạn chưa\ncheckout', const Color(0xFFF97316), Icons.access_time),
          const SizedBox(width: 8),
          _buildStatusBox('Đi muộn 0 phút\nVề sớm 0 phút',
              const Color(0xFFEF4444), Icons.info_outline),
        ],
      ),
    );
  }

  Widget _buildStatusBox(String text, Color color, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 50,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Icon(icon, color: Colors.white.withOpacity(0.8), size: 16),
            const SizedBox(width: 4),
            Expanded(
              child: Text(text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
