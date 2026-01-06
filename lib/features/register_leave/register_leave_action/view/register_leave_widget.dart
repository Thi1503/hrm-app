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
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: 'Tất cả',
                  items: ['Tất cả', 'Đã duyệt', 'Chờ duyệt', 'Hủy']
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
          _buildActionButton(
            icon: Icons.add,
            onTap: () => Get.toNamed(AppRoute.routeRegisterLeaveDetail),
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

  // 3. Danh sách các đơn nghỉ phép (Mock data 5 trạng thái)
  Widget _buildLeaveList() {
    final List<Map<String, dynamic>> mockData = [
      {
        'title': 'Xin nghỉ phép tháng 12/2025',
        'date': '22/12/2025',
        'reason': 'Em về quê có việc gia đình ạ',
        'time': '08:47 15/12/2025',
        'status': 'Đã duyệt',
        'statusColor': Colors.green,
      },
      {
        'title': 'Xin nghỉ phép tháng 12/2025',
        'date': '15/12/2025',
        'reason': 'Nghỉ ốm',
        'time': '09:00 14/12/2025',
        'status': 'Chờ quản lý duyệt',
        'statusColor': Colors.orange,
      },
      {
        'title': 'Xin nghỉ phép tháng 12/2025',
        'date': '10/12/2025',
        'reason': 'Việc cá nhân',
        'time': '14:30 08/12/2025',
        'status': 'Chờ nhân sự duyệt',
        'statusColor': Colors.blue,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: mockData.length,
      itemBuilder: (context, index) => _buildLeaveCard(mockData[index]),
    );
  }

  // 4. Widget Card hiển thị thông tin đơn
  Widget _buildLeaveCard(Map<String, dynamic> data) {
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
          Text(data['title'],
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          _buildInfoRow('Ngày nghỉ:', data['date']),
          _buildInfoRow('Lý do:', data['reason']),
          if (data['extra_label'] != null)
            _buildInfoRow(
                data['extra_label'], data['extra_reason'] ?? data['reason']),
          const SizedBox(height: 12),
          Text(data['time'],
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.circle, color: data['statusColor'], size: 10),
              const SizedBox(width: 6),
              Text(data['status'],
                  style: TextStyle(
                      color: data['statusColor'], fontWeight: FontWeight.bold)),
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
