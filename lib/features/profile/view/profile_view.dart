part of 'profile_page.dart';

extension ProfileView on ProfilePage {
  Widget buildBody() {
    return Container(
      color: const Color(0xFFF5F5F5),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.tabCtrl,
        children: [
          _buildInfo(_buildBasicInfo()),
          _buildInfo(_buildWorkingInfo()),
        ],
      ),
    );
  }

  Widget _buildInfo(List<Widget> children) {
    if (children.isEmpty) return placeholder;
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: children.length,
      itemBuilder: (_, index) => children[index],
      separatorBuilder: (_, __) => UtilWidgets.buildDivider(),
    );
  }

  Widget get placeholder => UtilWidgets.buildEmptyData();
  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.colorHeadPayroll,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.only(
        top: Get.mediaQuery.padding.top,
        bottom: 20,
      ),
      child: Column(
        children: [
          _buildCustomAppBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildAvatarWithCamera(),
              const SizedBox(width: 16),
              _buildNameAndJob(),
            ],
          ),
        ],
      ),
    );
  }

  // AppBar tùy chỉnh nằm trong Gradient
  Widget _buildCustomAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
            onPressed: () => Get.back(),
          ),
          const Text(
            'Thông tin cá nhân',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 22,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  // Avatar có nút camera như ảnh
  Widget _buildAvatarWithCamera() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 95,
          height: 95,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.6), width: 2),
          ),
          child: ClipOval(
            child: Image.asset(
              Assets.ASSETS_IMAGES_IMAGE_DEFAULT_JPG,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 5),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child:
                Icon(Icons.camera_alt, color: AppColors.mainColors, size: 16),
          ),
        ),
      ],
    ).paddingOnly(left: 16);
  }

  Widget _buildNameAndJob() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lê Đình Thi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Lập trình viên HDDT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  // 2. TabBar
  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: TabBar(
        isScrollable: true,
        controller: controller.tabCtrl,
        labelColor: const Color(0xFFEA580C),
        unselectedLabelColor: const Color(0xFF64748B),
        indicatorColor: const Color(0xFFEA580C),
        indicatorWeight: 3,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        tabs: const [
          Tab(text: 'Thông tin cơ bản'),
          Tab(text: 'Thông tin làm việc'),
        ],
      ),
    );
  }

  // 3. Thông tin cơ bản (Dữ liệu khớp 100% ảnh)
  List<Widget> _buildBasicInfo() {
    return [
      ProfileListTile(
        icon: Icons.calendar_today_outlined,
        title: 'Ngày sinh',
        subtitle: '10/08/2002',
      ),
      ProfileListTile(
        icon: Icons.transgender,
        title: 'Giới tính',
        subtitle: 'Nam',
      ),
      ProfileListTile(
        icon: Icons.badge_outlined,
        title: 'CMND/CCCD',
        subtitle: '025202008581',
      ),
      ProfileListTile(
        icon: Icons.phone_android_outlined,
        title: 'Số điện thoại',
        subtitle: '0384257775',
      ),
      ProfileListTile(
        icon: Icons.email_outlined,
        title: 'Email',
        subtitle: 'ledinhthi2k3@gmail.com',
      ),
      ProfileListTile(
        icon: Icons.location_on_outlined,
        title: 'Địa chỉ hiện tại',
        subtitle: 'Thường Tín, Hà Nội',
      ),
      const SizedBox(height: 20),
    ];
  }

  // 4. Thông tin làm việc
  List<Widget> _buildWorkingInfo() {
    return [
      ProfileListTile(
        icon: Icons.person_pin_outlined,
        title: 'Mã nhân viên',
        subtitle: 'NS0433',
      ),

      ProfileListTile(
        icon: Icons.account_tree_outlined,
        title: 'Phòng ban',
        subtitle: 'Phòng phần mềm mobile',
      ),
      ProfileListTile(
        icon: Icons.work_history_outlined,
        title: 'Chức danh',
        subtitle: 'Lập trình viên HDDT',
      ),
      ProfileListTile(
        icon: Icons.timeline_outlined,
        title: 'Thâm niên',
        subtitle: '4 tháng, 20 ngày',
      ),
      ProfileListTile(
        icon: Icons.business_outlined,
        title: 'Email công ty',
        subtitle: 'thild@softdreams.vn',
      ),
      ProfileListTile(
        icon: Icons.event_available_outlined,
        title: 'Ngày vào công ty',
        subtitle: '21/05/2024',
      ),
      const SizedBox(height: 20),
    ];
  }
}
