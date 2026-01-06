import 'package:do_an_application/assets.dart';
import 'package:do_an_application/const/colors.dart';
import 'package:do_an_application/features/profile/controller/profile_controller.dart';
import 'package:do_an_application/features/profile/view/profile_list_tile.dart';
import 'package:do_an_application/utils/widgets/util_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/widgets/base_widget.dart';

part 'profile_view.dart';

class ProfilePage extends BaseGetWidget<ProfileController> {
  ProfileController get controller => _controller;

  late final _controller = Get.put(ProfileController());

  ProfilePage({super.key});

  @override
  Widget buildWidgets() {
    return Scaffold(
      body: Column(
        children: [
          _buildProfileHeader(),
          _buildHeader(),
          Expanded(
            child: buildBody(),
          ),
        ],
      ),
    );
  }
}
