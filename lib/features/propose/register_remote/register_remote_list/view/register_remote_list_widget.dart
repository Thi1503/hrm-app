part of 'register_remote_list_page.dart';

extension RegisterRemoteListWidget on RegisterRemoteListPage {
  // 1. AppBar với Gradient cam và TabBar màu vàng
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text(
        'Làm việc ngoài công ty, công tác',
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

  // 2. Bộ lọc Trạng thái + Nút Thêm/Lọc
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
                  items:
                      ['Tất cả', 'Đã duyệt', 'Chờ duyệt'].map((String value) {
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
      onTap: () => Get.toNamed(AppRoute.routeRegisterRemoteForm),
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

  Widget _buildRemoteList() {
    final List<Map<String, dynamic>> mockData = [
      {
        'title': 'Làm việc bên ngoài tháng 10/2025',
        'method': 'Làm việc bên ngoài',
        'date': '07/10/2025',
        'reason': 'Gặp khách hàng ký hợp đồng tại Long Biên',
        'status': 'Đã duyệt',
        'statusColor': Colors.green,
      },
      {
        'title': 'Làm việc bên ngoài tháng 08/2025',
        'type': 'Trong ngày',
        'method': 'Làm việc bên ngoài',
        'shift': 'Ca hành chính',
        'date': '27/08/2025',
        'reason':
            'Xung quanh nhà em bị ngập không di chuyển lên công ty được ạ',
        'status': 'Đã duyệt',
        'statusColor': Colors.green,
      },
      {
        'title': 'Làm việc bên ngoài tháng 07/2025',
        'type': 'Trong ngày',
        'method': 'Làm việc bên ngoài',
        'shift': 'Ca hành chính',
        'date': '22/07/2025',
        'reason': 'Hỗ trợ triển khai vBHXH tại đơn vị',
        'status': 'Chờ duyệt',
        'statusColor': Colors.orange,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: mockData.length,
      itemBuilder: (context, index) => _buildRemoteCard(mockData[index]),
    );
  }

  Widget _buildRemoteCard(Map<String, dynamic> data) {
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
            data['title'] ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          _buildInfoRow('Hình thức:', data['method'] ?? ''),
          _buildInfoRow('Ngày OT:', data['date'] ?? ''),
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
            child: Text(label,
                style: const TextStyle(color: Colors.black54, fontSize: 13)),
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
