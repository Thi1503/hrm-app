part of 'individual_page.dart';

extension IndividualWidget on IndividualPage {
  Widget _buildBody() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildMenuItem(
          icon: Icons.update,
          iconColor: Colors.blue,
          title: 'Lịch sử chấm công',
          onTap: () => Get.toNamed(AppRoute.routeHistoryExplanation),
        ),
        _buildMenuItem(
          icon: Icons.grid_on_outlined,
          iconColor: Colors.teal,
          title: 'Bảng công',
          onTap: () => Get.toNamed(AppRoute.routeWorkSheet),
        ),
        _buildMenuItem(
          icon: Icons.account_balance_wallet_outlined,
          iconColor: Colors.green,
          title: 'Bảng lương',
          onTap: () {},
        ),
        _buildMenuItem(
          icon: Icons.key_outlined,
          iconColor: Colors.lightGreen,
          title: 'Đổi mật khẩu',
          onTap: () {},
        ),
      ],
    );
  } // Helper widget xây dựng từng dòng menu dóng hàng chuẩn

  Widget _buildMenuItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    void Function()? onTap,
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
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            size: 24,
            color: Colors.black45,
          ),
          onTap: onTap,
        ),
        const Divider(
          height: 1,
          indent: 70, // Căn lề divider khớp với phần title
          endIndent: 0,
          color: Color(0xFFEEEEEE),
        ),
      ],
    );
  }
}
