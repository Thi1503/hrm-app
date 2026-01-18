part of 'home_page.dart';

extension HomeWidget on HomePage {
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppDimens.radius4),
              ),
              gradient: LinearGradient(
                colors: AppColors.colorHeadPayroll,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            constraints: BoxConstraints.tightFor(
              height: AppDimens.sizeIconExtraLarge,
            ),
          ),
          Column(
            children: [
              _buildStaffProfile(),
              _buildTimekeepingTable(),
              _buildTimekeepingActions(),
              buildStatusHistory(),
            ],
          ).paddingSymmetric(
            vertical: AppDimens.heightImageLogoHome,
            horizontal: AppDimens.paddingMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildStaffProfile() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onDoubleTap: Diolog().showDiolog,
              child: UtilWidgets.buildText(
                'Xin chào,',
                textColor: AppColors.colorWhite,
                fontSize: AppDimens.fontBiggest(),
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: AppDimens.sizeImage,
                height: AppDimens.sizeImage,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  border: Border.all(color: Colors.white, width: 1.5),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    Assets.ASSETS_IMAGES_IMAGE_DEFAULT_JPG,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: UtilWidgets.buildText(
                controller.appController.myInfoResponse.value?.fullName ?? 'Người dùng',
                textColor: AppColors.colorWhite,
                fontSize: AppDimens.fontBiggest(),
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: UtilWidgets.buildTextScale(
                controller.appController.myInfoResponse.value?.position ?? '',
                textColor: AppColors.colorWhite.withOpacity(0.9),
                fontSize: AppDimens.fontSmall(),
                overflow: TextOverflow.ellipsis,
              ).paddingOnly(top: 4),
              onTap: () => Get.toNamed(AppRoute.routeProfile),
            ),
          ],
        ));
  }

  Widget _buildTimekeepingTable() {
    return UtilWidgets.buildCardBase(
      Column(
        children: [
          _buildSingleShift(),
          InkWell(
            onTap: () {},
            child: UtilWidgets.buildText(
              'Xem chi tiết',
              textAlign: TextAlign.center,
              textColor: AppColors.primaryLight2,
              fontSize: 14,
            ).paddingSymmetric(vertical: AppDimens.paddingVerySmall),
          ),
        ],
      ),
      radius: AppDimens.radius13,
    );
  }

  Widget _buildSingleShift() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UtilWidgets.buildText(
          'Ca làm việc',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          textColor: AppColors.colorBlack,
        ),
        sdsSBHeight8,
        Row(
          children: [
            Expanded(
              child: buildTime(
                label: 'Vào ca',
                value: DateTime(2026, 01, 06, 08, 00),
                alignment: CrossAxisAlignment.start,
              ),
            ),
            Expanded(
              child: buildTime(
                label: 'Ra ca',
                value: DateTime(2026, 01, 06, 17, 30),
                alignment: CrossAxisAlignment.end,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: AppDimens.paddingMedium),
      ],
    ).paddingSymmetric(
      vertical: AppDimens.paddingSmall,
      horizontal: AppDimens.paddingMedium,
    );
  }

  Widget buildTime({
    String? label,
    DateTime? value,
    required CrossAxisAlignment alignment,
  }) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        UtilWidgets.buildText(
          label ?? '',
          fontSize: 14,
          textColor: AppColors.colorBlack,
        ),
        sdsSBHeight8,
        UtilWidgets.buildText(
          convertDateToString(value ?? DateTime.now(), PATTERN_11),
          fontSize: 14,
          textColor: AppColors.colorBlack,
        ),
      ],
    );
  }

  Widget _buildTimekeepingActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildTimekeepingAction(
                label: 'Check in',
                route: '',
              ),
            ),
            sdsSBWidth12,
            Expanded(
              child: _buildTimekeepingAction(
                label: 'Check out',
                route: '',
              ),
            ),
          ],
        ),
        sdsSBHeight8,
        UtilWidgets.buildText(
          'Chi tiết chấm công',
          textColor: AppColors.colorBlack,
          fontSize: AppDimens.fontSmall(),
          fontWeight: FontWeight.bold,
        ).paddingOnly(top: AppDimens.paddingVerySmall),
      ],
    ).paddingSymmetric(vertical: AppDimens.defaultPadding);
  }

  Widget _buildTimekeepingAction({
    required String label,
    required String route,
  }) {
    return UtilWidgets.buildCardBase(
      ListTile(
        leading: SvgPicture.asset(
          Assets.ASSETS_ICONS_ICON_CLOCK_HISTORY_SVG,
          fit: BoxFit.cover,
        ),
        title: UtilWidgets.buildText(
          label,
          overflow: TextOverflow.visible,
          fontSize: AppDimens.fontSmall(),
          textColor: AppColors.colorBlack,
        ),
        onTap: () => Get.toNamed(route),
        horizontalTitleGap: AppDimens.paddingSmallest,
      ),
      radius: AppDimens.radius13,
    );
  }

  Widget buildStatusHistory() {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Container(
            color: AppColors.primaryLight2,
            width: 6,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(AppDimens.radius8),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.ASSETS_ICONS_ICON_CLOCK_HISTORY_SVG,
                    fit: BoxFit.cover,
                  ).paddingAll(AppDimens.paddingSearchBarSmall),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [_buildDate(), sdsSBWidth4, _buildStatus()],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDate() {
    return Row(
      children: [
        UtilWidgets.buildText(
          'Thời gian chấm công: ',
          textColor: AppColors.colorBlack,
          fontSize: AppDimens.fontSmall(),
        ),
        UtilWidgets.buildText(
          convertDateToString(DateTime(2026, 01, 06, 07, 59), PATTERN_11),
          textColor: AppColors.colorBlack,
          fontSize: AppDimens.fontSmall(),
        ),
      ],
    );
  }

  Widget _buildStatus() {
    return Row(
      children: [
        UtilWidgets.buildText(
          'Trạng thái: ',
          textColor: AppColors.colorBlack,
          fontSize: AppDimens.fontSmall(),
        ),
        UtilWidgets.buildText(
          'Thành công',
          fontSize: AppDimens.fontSmall(),
          textColor: AppColors.color0B8E3F,
        ),
      ],
    );
  }
}
