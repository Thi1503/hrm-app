part of 'timekeeping_explanation_form_page.dart';

extension TimekeepingExplanationFormWidget on TimekeepingExplanationFormPage {
  // 2. Nội dung Form nhập liệu
  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimekeepingDate(),
          sdsSBHeight12,
          _buildExplanationTypeDropdown(),
          sdsSBHeight12,
          _buildReasonInput(),
        ],
      ),
    );
  }

  // Ngày chấm công
  Widget _buildTimekeepingDate() {
    return BuildInputTextWithLabel(
      label: 'Ngày chấm công',
      isRequired: true,
      inputTextModel: InputTextModel(
        controller: controller.timekeepingDateCtrl,
        hintText: PATTERN_1,
        suffixIcon: IconButton(
          onPressed: () async {
            final result = await UtilWidgets.buildDateTimePicker(
              dateTimeInit: convertStringToDateSafe(
                    controller.timekeepingDateCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (result == null) return;
            controller.timekeepingDateCtrl.text =
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

  // 3. Thanh nút bấm dưới cùng (Sticky Footer)
  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 24),
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
              () => controller.submitExplanation(),
            ),
          ),
        ],
      ),
    );
  }

  // --- HELPER WIDGETS ---

  Widget _buildLabel(String label, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
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

  Widget _buildExplanationTypeDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('Loại giải trình', isRequired: true),
        Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: controller.explanationTypeSelected.value.isEmpty
                    ? null
                    : controller.explanationTypeSelected.value,
                hint: const Text('Chọn loại giải trình',
                    style: TextStyle(fontSize: 14, color: Colors.black38)),
                icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.orange),
                items: controller.explanationTypeMap.keys.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(fontSize: 14)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.explanationTypeSelected.value = value;
                  }
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
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
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSelectUploadFile() {
    return ExcludeFocus(
      child: AppSelectImageWidget(
        checkMaxImageAttachments: () {
          return true;
        },
        onPickImage: () {},
        onTakePhoto: () {},
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
}
