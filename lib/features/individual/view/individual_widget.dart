part of 'individual_page.dart';

extension IndividualWidget on IndividualPage {
  // 1. Build AppBar với Gradient Cam và nút Đăng xuất
  PreferredSizeWidget _buildGradientAppBar() {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      title: const Text(
        'Cá nhân',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          onPressed: () {
            Get.offAllNamed(AppRoute.routeLogin);
          },
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.colorHeadPayroll,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  // 2. Danh sách các item menu
  List<Widget> _buildMenuItems() {
    final List<Map<String, dynamic>> items = [
      {
        'title': 'Lịch sử chấm công',
        'icon': Icons.update,
        'color': Colors.blue
      },
      {
        'title': 'Bảng công',
        'icon': Icons.grid_on_outlined,
        'color': Colors.teal
      },
      {
        'title': 'Bảng lương',
        'icon': Icons.account_balance_wallet_outlined,
        'color': Colors.green
      },
      {
        'title': 'Đổi mật khẩu',
        'icon': Icons.key_outlined,
        'color': Colors.lightGreen
      },
    ];

    return items
        .map((item) => _buildMenuTile(
              title: item['title'],
              icon: item['icon'],
              iconColor: item['color'],
            ))
        .toList();
  }

  // 3. Widget cho từng dòng menu
  Widget _buildMenuTile({
    required String title,
    required IconData icon,
    required Color iconColor,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15), // Nền màu nhạt cho icon
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1E293B),
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black87,
            size: 28,
          ),
          onTap: () {
            // Điều hướng khi click
          },
        ),
        const Divider(
            height: 1,
            indent: 70,
            endIndent: 0,
            color: Color(0xFFEEEEEE)), // Đường kẻ ngăn cách
      ],
    );
  }
}
