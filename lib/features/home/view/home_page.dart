import 'package:do_an_application/assets.dart';
import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/const/dimens.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:do_an_application/utils/date_utils.dart';
import 'package:do_an_application/utils/sized_box/sized_box.dart';
import 'package:do_an_application/utils/widgets/util_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

part 'home_widget.dart';

class HomePage extends BaseGetWidget {
  const HomePage({super.key});

  @override
  Widget buildWidgets() {
    return Scaffold(
      body: _buildBody(),
    );
  }
}
