part of 'register_remote_form_page.dart';

extension RegisterRemoteFormWidget on RegisterRemoteFormPage {
  // 2. Nội dung Form nhập liệu
  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ngày Remote
          _buildRegisterRemoteDate(),

          // Hình thức
          _buildDropdownField(),
          _buildReasonInput(),
        ],
      ),
    );
  }

  Widget _buildRegisterRemoteDate() {
    return BuildInputTextWithLabel(
      label: 'Ngày Remote',
      isRequired: true,
      inputTextModel: InputTextModel(
        controller: controller.registerRemoteCtrl,
        hintText: PATTERN_1,
        suffixIcon: IconButton(
          onPressed: () async {
            final result = await UtilWidgets.buildDateTimePicker(
              dateTimeInit: convertStringToDateSafe(
                    controller.registerRemoteCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (result == null) return;
            controller.registerRemoteCtrl.text =
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

  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildButton(
              'Đóng',
              Colors.grey.shade400,
              () => Get.back(),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildButton(
              'Gửi phê duyệt',
              const Color(0xFFF97316),
              () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField() {
    /// TODO: Mock tạm
    final List<String> remoteTypes = [
      'Nghỉ phép năm',
      'Nghỉ ốm/đau',
      'Nghỉ không lương',
      'Nghỉ chế độ (Thai sản/Kết hôn)',
      'Nghỉ bù',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabelInput(
          label: 'Hình thức',
          isRequired: true,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
            color: Colors.white,
          ),
          child: DropdownButtonHideUnderline(
            child: Obx(
              () => DropdownButton<String>(
                isExpanded: true,
                value: controller.registerRemoteType.value.isEmpty
                    ? null
                    : controller.registerRemoteType.value,
                hint: const Text(
                  'Chọn hình thức',
                  style: TextStyle(fontSize: 14, color: Colors.black38),
                ),
                items: remoteTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  if (newValue != null) {
                    controller.registerRemoteType.value = newValue;
                  }
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ),
        sdsSBHeight8,
      ],
    );
  }

  Widget _buildLabelInput({
    required String label,
    bool isRequired = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          children: isRequired
              ? [
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ]
              : [],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12),
        elevation: 0,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildReasonInput() {
    return BuildInputTextWithLabel(
      label: 'Lý do',
      inputTextModel: InputTextModel(
        controller: controller.reasonCtrl,
        hintText: 'Nhập lý do...',
        maxLines: 3,
        showIconClear: false,
        focusedBorder: _outlineInputBorder(),
        focusedErrorBorder: _outlineInputBorder(),
        enabledBorder: _outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimens.radius6),
      borderSide: BorderSide(
        color: AppColors.gray7,
      ),
    );
  }
}
