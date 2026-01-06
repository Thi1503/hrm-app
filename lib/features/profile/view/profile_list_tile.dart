import 'package:do_an_application/const/dimens.dart';
import 'package:do_an_application/utils/widgets/util_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/colors.dart';

final class ProfileListTile extends StatelessWidget {
  /// Create a new [ProfileListTile].
  const ProfileListTile({
    super.key,
    this.title,
    this.subtitle,
    this.icon,
    this.onTap,
  }) : separator = const SizedBox.shrink();

  /// Create a new [ProfileListTile] with a [separator].
  const ProfileListTile.separator(
    this.separator, {
    super.key,
    this.title,
    this.subtitle,
    this.icon,
    this.onTap,
  });

  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Widget separator;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        separator,
        _buildTile(),
      ],
    );
  }

  Widget _buildTile() {
    return ListTile(
      dense: true,
      onTap: onTap,
      leading: SizedBox(
        height: double.infinity,
        child: Icon(
          icon,
          color: AppColors.mainColors,
        ),
      ),
      title: UtilWidgets.buildText(
        title ?? '',
        fontSize: AppDimens.fontSmall(),
        textColor: Colors.grey,
      ),
      subtitle: UtilWidgets.buildText(
        subtitle ?? '',
        maxLine: 6,
        fontSize: AppDimens.fontMedium(),
        textColor: AppColors.colorBlack,
      ).paddingOnly(bottom: AppDimens.paddingSmallest),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimens.sizeIconMedium,
      ),
      horizontalTitleGap: AppDimens.paddingSmallest,
    );
  }
}
