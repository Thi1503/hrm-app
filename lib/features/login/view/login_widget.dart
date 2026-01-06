part of 'login_page.dart';

extension LoginWidget on LoginPage {
  Widget _buildBody() {
    return SafeArea(
      child: Form(
        key: controller.formKey,
        autovalidateMode: controller.autovalidateMode.value,
        child: Obx(
          () {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildLogo(),
                        const SizedBox(height: AppDimens.padding24),
                        _buildInputAccount(),
                        sdsSBHeight12,
                        _buildInputPassword(),
                        sdsSBHeight12,
                        _buildButtonLogin(),
                        sdsSBHeight12,
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ).paddingAll(AppDimens.defaultPadding),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Image.asset(
        Assets.ASSETS_IMAGES_ICON_HRM_PNG,
        width: Get.width / 2,
      ),
    ).paddingOnly(top: AppDimens.paddingSmall);
  }

  Widget _buildInputAccount() {
    return BuildInputText(
      InputTextModel(
        controller: controller.usernameTextCtrl,
        hintText: 'Nhập tên đăng nhập',
        inputFormatters: InputFormatterEnum.password,
        autovalidateMode: controller.autovalidateMode.value,
        maxLengthInputForm: 25,
        isShowCounterText: false,
        borderRadius: AppDimens.radius6,
        validator: (value) {
          final trimmedValue = value?.trim() ?? '';
          if (trimmedValue.isEmpty) {
            return 'Vui lòng tên đăng nhập';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildInputPassword() {
    return BuildInputText(
      InputTextModel(
        hintText: 'Nhập mật khẩu'.tr,
        controller: controller.passwordTextCtrl,
        isShowCounterText: false,
        autovalidateMode: controller.autovalidateMode.value,
        inputFormatters: InputFormatterEnum.password,
        maxLengthInputForm: 50,
        obscureText: true,
        borderRadius: AppDimens.radius6,
        validator: (value) {
          final trimmedValue = value?.trim() ?? '';
          if (trimmedValue.isEmpty) {
            return 'Vui lòng nhập mật khẩu';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildButtonLogin() {
    return UtilWidgets.buildSolidButton(
      title: 'Đăng nhập',
      height: AppDimens.btnLargeFigma,
      onPressed:controller.login,
    );
  }
}
