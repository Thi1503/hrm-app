part of 'main_page.dart';

extension MainWidget on MainPage {
  Widget _buildNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        // 1. ĐỔI MÀU NAVBAR THÀNH TRẮNG
        backgroundColor: Colors.white,

        currentIndex: controller.currentIndex.value,
        onTap: controller.onTabTapped,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primary2,
        unselectedItemColor: const Color(0xFF9BA3B1),

        selectedFontSize: AppDimens.fontSmall(),
        unselectedFontSize: AppDimens.fontSmall(),

        selectedLabelStyle: const TextStyle(height: 1.5),
        unselectedLabelStyle: const TextStyle(height: 1.5),

        items: [
          _buildNavigationItem(
            label: 'Trang chủ',
            icon: Assets.ASSETS_ICONS_ICON_HOME_SVG,
            activeIcon: Assets.ASSETS_ICONS_ICON_HOME_SELECT_SVG,
          ),
          _buildNavigationItem(
            label: 'Đề xuất',
            icon: Assets.ASSETS_ICONS_ICON_ADVANCED_SVG,
            activeIcon: Assets.ASSETS_ICONS_ICON_ADVANCED_SELECT_SVG,
          ),
          _buildNavigationItem(
            isBadgeVisible: true,
            label: 'Thông báo',
            icon: Assets.ASSETS_ICONS_ICON_NOTIFICATION_SVG,
            activeIcon: Assets.ASSETS_ICONS_ICON_NOTIFICATION_SELECT_SVG,
          ),
          _buildNavigationItem(
            label: 'Quản lý',
            icon: Assets
                .ASSETS_ICONS_ICON_PROFILE_SVG, // Giữ string để không lỗi parameter
            activeIcon: Assets.ASSETS_ICONS_ICON_PROFILE_SELECT_SVG,
            useSvg: false, // Flag để dùng Icons.inventory_2
          ),
          _buildNavigationItem(
            label: 'Cá nhân',
            icon: Assets.ASSETS_ICONS_ICON_PROFILE_SVG,
            activeIcon: Assets.ASSETS_ICONS_ICON_PROFILE_SELECT_SVG,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationItem({
    required String label,
    required String icon,
    required String activeIcon,
    bool useSvg = true,
    bool isBadgeVisible = false,
  }) {
    const double iconSize = 24.0;

    // Chuẩn bị Widget SVG
    final iconWidget =
        SvgPicture.asset(icon, width: iconSize, height: iconSize);
    final activeSvgIcon =
        SvgPicture.asset(activeIcon, width: iconSize, height: iconSize);

    // Chuẩn bị Widget Icon Flutter (Cho mục Quản lý)
    final iconManage = const Icon(Icons.inventory_2_outlined, size: iconSize);
    final activeIconManage = const Icon(Icons.inventory_2, size: iconSize);

    // 2. Tối ưu hóa việc chọn Icon để dùng chung cho cả phần Badge
    final Widget finalIcon = useSvg ? iconWidget : iconManage;
    final Widget finalActiveIcon = useSvg ? activeSvgIcon : activeIconManage;

    if (!isBadgeVisible) {
      return BottomNavigationBarItem(
        label: label,
        icon: finalIcon,
        activeIcon: finalActiveIcon,
      );
    }

    // Logic cho Badge (Đã sửa để dùng được cả Icon Flutter)
    const count = 90;
    final countLabel = count < 100 ? '$count' : '99+';

    return BottomNavigationBarItem(
      label: label,
      icon: Badge(
        label: Text(
          countLabel,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        isLabelVisible: count > 0,
        backgroundColor: Colors.red,
        offset: const Offset(8, -4),
        child: finalIcon, // Dùng finalIcon thay vì fix cứng iconWidget
      ),
      activeIcon: Badge(
        label: Text(
          countLabel,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        isLabelVisible: count > 0,
        backgroundColor: Colors.red,
        offset: const Offset(8, -4),
        child:
            finalActiveIcon, // Dùng finalActiveIcon thay vì fix cứng activeSvgIcon
      ),
    );
  }
}
