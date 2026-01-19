part of 'register_leave_page.dart';

extension RegisterLeaveWidget on RegisterLeavePage {
// 1. Build AppBar đồng bộ hoàn toàn về Font và Màu sắc
  PreferredSizeWidget buildAppBar() {
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
  Widget buildFilterHeader() {
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
          buildActionButton(
            icon: Icons.add,
            onTap: () async {
              final result = await Get.toNamed(AppRoute.routeRegisterLeaveForm);
              if (result == true) {
                controller.fetchLeaveRequests();
              }
            },
            color: const Color(0xFFF97316),
          ),
        ],
      ),
    );
  }

  Widget buildActionButton({
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

  Color getStatusColor(RequestStatus status) {
    if (status.isApproved) return Colors.green;
    if (status.isRejected) return Colors.red;
    if (status.isCancelled) return Colors.grey;
    if (status.isPendingManager) return Colors.orange;
    if (status.isPendingHR) return Colors.blue;
    return Colors.grey;
  }

  Widget buildInfoRow(String label, String value) {
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
