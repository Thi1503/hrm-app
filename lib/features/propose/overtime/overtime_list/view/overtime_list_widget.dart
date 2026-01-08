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
            child: Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: 'Tất cả',
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.orange),
                  items: [
                    'Tất cả',
                    'Đã duyệt',
                    'Không phê duyệt',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(fontSize: 14)),
                    );
                  }).toList(),
                  onChanged: (_) {},
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
      onTap: () {
        Get.toNamed(AppRoute.routeOverTimeForm);
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
    final List<Map<String, dynamic>> mockData = [
      {
        'title': 'Làm thêm giờ tháng 12/2025',
        'otDate': '02/01/2026',
        'startHour': '17:30',
        'endHour': '18:06',
        'total': '0.6',
        'reason': 'Hoàn thiện báo cáo tồn kho cho Easy Book',
        'status': 'Không phê duyệt',
        'statusColor': Colors.red,
      },
      {
        'title': 'Làm thêm giờ tháng 12/2025',
        'otDate': '01/08/2025',
        'startHour': '18:00',
        'endHour': '20:00',
        'total': '2.0',
        'reason': 'Fix giao diện vBHXH',
        'status': 'Đã duyệt',
        'statusColor': Colors.green,
      },
      {
        'title': 'Làm thêm giờ tháng 12/2025',
        'otDate': '01/07/2025',
        'startHour': '08:00',
        'endHour': '14:30',
        'total': '6.5',
        'reason': 'Chạy deadline vBHXH cho dự án com.viettel.ttcntt.vbhxh.uat',
        'status': 'Đã duyệt',
        'statusColor': Colors.green,
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: mockData.length,
      itemBuilder: (context, index) => _buildOvertimeCard(mockData[index]),
      separatorBuilder: (context, index) => sdsSBHeight12,
    );
  }

  // 4. Widget Card chi tiết
  // 2. Cập nhật giao diện Card chi tiết
  Widget _buildOvertimeCard(Map<String, dynamic> data) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['title'] ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 8),
          _buildInfoRow('Ngày OT:', data['otDate'] ?? ''),
          _buildInfoRow('Giờ bắt đầu:', data['startHour'] ?? ''),
          _buildInfoRow('Giờ kết thúc:', data['endHour'] ?? ''),
          _buildInfoRow('Tổng số giờ:', data['total'] ?? ''),
          _buildInfoRow('Lý do:', data['reason'] ?? ''),
          sdsSBHeight8,
          Row(
            children: [
              Icon(Icons.circle,
                  color: data['statusColor'] ?? Colors.grey, size: 10),
              sdsSBWidth8,
              Text(
                data['status'] ?? '',
                style: TextStyle(
                  color: data['statusColor'] ?? Colors.grey,
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
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
}
