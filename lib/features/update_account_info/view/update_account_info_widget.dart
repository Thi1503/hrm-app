part of 'update_account_info_page.dart';

extension UpdateAccountInfoWidget on UpdateAccountInfoPage {
  // 2. Nội dung Form nhập liệu
  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBirthDayDate(),
          sdsSBHeight8,
          _buildDropdownField(
            label: 'Giới tính',
            isRequired: true,
          ),
          sdsSBHeight12,
          _buildCCCD(),
          sdsSBHeight12,
          _buildPhoneNumber(),
          sdsSBHeight12,
          _buildEmail(),
          sdsSBHeight12,
          _buildAddressNow(),
        ],
      ),
    );
  }

  Widget _buildBirthDayDate() {
    return BuildInputTextWithLabel(
      label: 'Ngày sinh',
      isRequired: true,
      inputTextModel: InputTextModel(
        controller: controller.birthDayCtrl,
        hintText: PATTERN_1,
        suffixIcon: IconButton(
          onPressed: () async {
            final result = await UtilWidgets.buildDateTimePicker(
              dateTimeInit: convertStringToDateSafe(
                    controller.birthDayCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (result == null) return;
            controller.birthDayCtrl.text =
                convertDateToStringSafe(result, PATTERN_1) ?? '';
          },
          icon: Icon(
            Icons.calendar_month,
            color: AppColors.primary2,
          ),
        ),
        inputFormatters: InputFormatterEnum.dateFullBirthDay,
      ),
    );
  }

  // CMND/CCCD
  Widget _buildCCCD() {
    return BuildInputTextWithLabel(
      label: 'CMND/CCCD',
      isRequired: true,
      inputTextModel: InputTextModel(
        controller: controller.idCardCtrl,
        hintText: 'Nhập cmnd/cccd',
      ),
    );
  }

  // Số điện thoại
  Widget _buildPhoneNumber() {
    return BuildInputTextWithLabel(
      label: 'Số điện thoại',
      isRequired: true,
      inputTextModel: InputTextModel(
        controller: controller.phoneCtrl,
        hintText: 'Nhập số điện thoại',
      ),
    );
  }

  // Email
  Widget _buildEmail() {
    return BuildInputTextWithLabel(
      label: 'Email',
      isRequired: true,
      inputTextModel: InputTextModel(
        controller: controller.emailCtrl,
        hintText: 'Nhập email',
      ),
    );
  }

  // Địa chỉ hiện tại
  Widget _buildAddressNow() {
    return BuildInputTextWithLabel(
      label: 'Địa chỉ hiện tại',
      inputTextModel: InputTextModel(
        controller: controller.addressCtrl,
        maxLines: 3,
        hintText: 'Nhập địa chỉ',
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFEEEEEE))),
      ),
      child: ElevatedButton(
        onPressed: controller.onConfirm,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF97316),
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 48),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: const Text('Xác nhận',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }

  Widget _buildLabel(String label, bool isRequired) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 12),
      child: RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          children: isRequired
              ? [
                  const TextSpan(
                      text: ' (*)', style: TextStyle(color: Colors.red))
                ]
              : [],
        ),
      ),
    );
  }

  Widget _buildDropdownField({required String label, bool isRequired = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label, isRequired),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFD1D5DB)),
            color: const Color(0xFFF3F4F6), // Nền xám nhẹ cho dropdown
          ),
          child: DropdownButtonHideUnderline(
            child: Obx(() => DropdownButton<String>(
                  isExpanded: true,
                  value: controller.selectedGender.value,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.orange),
                  items: controller.genders
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: const TextStyle(fontSize: 14))))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) controller.selectedGender.value = val;
                  },
                )),
          ),
        ),
      ],
    );
  }
}
