import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../const/colors.dart';
import '../../const/dimens.dart';
import '../../generated/locales.g.dart';
import 'app_scaffold.dart';

class DataEmpty extends StatelessWidget {
  final String? dataEmpty;

  const DataEmpty({super.key, this.dataEmpty});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.appBarBackgroundColor,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Center(
            child: Text(
          dataEmpty ?? LocaleKeys.app_dataEmpty.tr,
          style: TextStyle(
            fontSize: AppDimens.fontMedium(),
            color: AppColors.textColor(),
          ),
        )),
      ),
    );
  }
}
