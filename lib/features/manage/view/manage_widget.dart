part of 'manage_page.dart';

extension ManageWidget on ManagePage {
  PreferredSizeWidget _buildGradientAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: const Text(
        'Quản lý',
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
    );
  }

  // 2. Danh sách các item Quản lý
  List<Widget> _buildManageItems() {
    final List<Map<String, dynamic>> items = [
      {
        'title': 'Phòng ban',
        'icon': Icons.groups_outlined,
        'color': Colors.blue,
      },
      {
        'title': 'Chức vụ',
        'icon': Icons.badge_outlined,
        'color': Colors.indigo,
      },
      {
        'title': 'Quản lý công',
        'icon': Icons.event_note_outlined,
        'color': Colors.teal,
      },
      {
        'title': 'Quản lý lương',
        'icon': Icons.monetization_on_outlined,
        'color': Colors.green,
      },
      {
        'title': 'Hồ sơ nhân viên',
        'icon': Icons.assignment_ind_outlined,
        'color': Colors.amber,
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

  // 3. Widget cho từng dòng menu (Đồng bộ style với màn Cá nhân)
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
              color: iconColor.withOpacity(0.15),
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
            color: Colors.black45,
            size: 28,
          ),
          onTap: () {
            // Xử lý điều hướng khi nhấn vào mục quản lý
          },
        ),
        const Divider(
          height: 1,
          indent: 70, // Để đường kẻ bắt đầu sau phần icon
          endIndent: 0,
          color: Color(0xFFEEEEEE),
        ),
      ],
    );
  }
}
