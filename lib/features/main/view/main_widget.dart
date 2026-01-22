part of 'main_page.dart';

extension MainWidget on MainPage {
  Widget _buildNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
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

    final iconWidget = SvgPicture.asset(
      icon,
      width: iconSize,
      height: iconSize,
    );
    final activeSvgIcon = SvgPicture.asset(
      activeIcon,
      width: iconSize,
      height: iconSize,
    );

    final iconManage = const Icon(
      Icons.inventory_2_outlined,
      size: iconSize,
    );
    final activeIconManage = const Icon(
      Icons.inventory_2,
      size: iconSize,
    );

    final Widget finalIcon = useSvg ? iconWidget : iconManage;
    final Widget finalActiveIcon = useSvg ? activeSvgIcon : activeIconManage;

    if (!isBadgeVisible) {
      return BottomNavigationBarItem(
        label: label,
        icon: finalIcon,
        activeIcon: finalActiveIcon,
      );
    }

    const count = 2;
    final countLabel = count < 100 ? '$count' : '99+';

    return BottomNavigationBarItem(
      label: label,
      icon: Badge(
        label: Text(
          countLabel,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        isLabelVisible: count > 0,
        backgroundColor: Colors.red,
        offset: const Offset(8, -4),
        child: finalIcon,
      ),
      activeIcon: Badge(
        label: Text(
          countLabel,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        isLabelVisible: count > 0,
        backgroundColor: Colors.red,
        offset: const Offset(8, -4),
        child: finalActiveIcon,
      ),
    );
  }
}
