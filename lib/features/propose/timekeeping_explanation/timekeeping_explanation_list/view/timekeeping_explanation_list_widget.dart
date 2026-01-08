part of 'timekeeping_explanation_list_page.dart';

extension TimekeepingExplanationListWidget on TimekeepingExplanationListPage {
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

  // 2. Bộ lọc trạng thái và nút chức năng
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
                  items: ['Tất cả', 'Chờ phê duyệt', 'Đã duyệt']
                      .map((String value) {
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
      onTap: () => Get.toNamed(AppRoute.routeTimekeepingExplanationForm),
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

  Widget _buildExplanationList() {
    final List<Map<String, dynamic>> mockData = [
      {
        'title': 'Giải trình tháng 01/2026',
        'date': '02/01/2026',
        'violation': 'Quên checkin',
        'reason':
            'Do máy chấm công tại cửa chính bị lỗi, không nhận diện được vân tay vào buổi sáng.',
        'status': 'Chờ nhân sự phê duyệt',
        'statusColor': Colors.blue,
      },
      {
        'title': 'Giải trình tháng 12/2025',
        'date': '29/12/2025',
        'violation': 'Quên checkin',
        'reason':
            'Đi công tác đột xuất tại đơn vị vBHXH nên không kịp thực hiện chấm công tại văn phòng.',
        'status': 'Đã duyệt',
        'statusColor': Colors.green,
      },
      {
        'title': 'Giải trình tháng 12/2025',
        'date': '13/12/2025',
        'violation': 'Quên checkin',
        'reason':
            'Quên mang thẻ nhân viên và ứng dụng trên điện thoại gặp sự cố kết nối mạng.',
        'status': 'Đã duyệt',
        'statusColor': Colors.green,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: mockData.length,
      itemBuilder: (context, index) => _buildExplanationCard(mockData[index]),
    );
  }

  Widget _buildExplanationCard(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
          _buildInfoRow('Ngày chấm công:', data['date'] ?? ''),
          _buildInfoRow('Loại giải trình:', data['violation'] ?? ''),
          _buildInfoRow('Lý do:', data['reason'] ?? ''),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.circle,
                  color: data['statusColor'] ?? Colors.grey, size: 10),
              const SizedBox(width: 6),
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
            width: 120, // Độ rộng label để dóng hàng thẳng cột
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
}
