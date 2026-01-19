import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/features/profile/models/gender_enum.dart';
import 'package:do_an_application/features/profile/models/my_info_response.dart';
import 'package:do_an_application/features/update_account_info/models/my_info_update_request.dart';
import 'package:do_an_application/features/update_account_info/repository/update_account_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class UpdateAccountInfoController extends BaseGetxController {
  late UpdateAccountInfoRepository repository =
      UpdateAccountInfoRepository(this);

  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final birthDayCtrl = TextEditingController();
  final idCardCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  // Quản lý giới tính
  final Rx<Gender> selectedGender = Gender.male.obs;
  final List<Gender> genders = Gender.values;

  @override
  void onInit() {
    super.onInit();
    _loadInitialData();
  }

  void _loadInitialData() {
    final MyInfoResponse? myInfo = Get.arguments as MyInfoResponse?;
    if (myInfo != null) {
      nameCtrl.text = myInfo.fullName;
      birthDayCtrl.text = formatDateTimeToString(myInfo.dateOfBirth);
      selectedGender.value = myInfo.gender;
      idCardCtrl.text = myInfo.idNumber;
      phoneCtrl.text = myInfo.phone;
      emailCtrl.text = myInfo.personalEmail;
      addressCtrl.text = myInfo.address;
    }
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    birthDayCtrl.dispose();
    idCardCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    addressCtrl.dispose();
    super.onClose();
  }

  String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName không được để trống';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Số điện thoại không được để trống';
    }
    if (!RegExp(r'^0\d{9}$').hasMatch(value)) {
      return 'Số điện thoại không hợp lệ';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email không được để trống';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  String? validateIdCard(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'CMND/CCCD không được để trống';
    }
    if (value.length != 9 && value.length != 12) {
      return 'CMND/CCCD phải có 9 hoặc 12 số';
    }
    return null;
  }

  Future<void> onConfirm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      showLoading();

      final dateOfBirth = convertStringToDate(birthDayCtrl.text, PATTERN_1);

      final request = MyInfoUpdateRequest(
        fullName: nameCtrl.text.trim(),
        citizenId: idCardCtrl.text.trim(),
        gender: selectedGender.value,
        dateOfBirth: dateOfBirth,
        phoneNumber: phoneCtrl.text.trim(),
        email: emailCtrl.text.trim(),
        address: addressCtrl.text.trim(),
      );

      final response = await repository.updateMyInfo(request);

      if (response.isSuccess) {
        showSnackBar('Cập nhật thông tin thành công');
        Get.back(result: true);
      } else {
        showSnackBar(response.message);
      }
    } catch (e) {
      logger.e(e);
      showSnackBar('Cập nhật thông tin thất bại. Vui lòng thử lại!');
    } finally {
      hideLoading();
    }
  }
}
