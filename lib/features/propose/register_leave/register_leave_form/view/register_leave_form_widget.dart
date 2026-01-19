part of 'register_leave_form_page.dart';

extension RegisterLeaveFormWidget on RegisterLeaveFormPage {
  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimens.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Từ ngày
          _buildFromDateInput(),
          sdsSBHeight12,

          // Đến ngày
          _buildToDateInput(),
          sdsSBHeight12,

          // Loại nghỉ
          _buildDropdownField(),
          sdsSBHeight12,

          // Tổng số ngày nghỉ
          //UI tính và hiển thị thôi
          _buildCountDayLeave(),
          sdsSBHeight12,

          // Lý do
          _buildReasonInput(),
          sdsSBHeight12,

          //tạm thời bỏ ko upload file
          // _buildLabelInput(label: 'File minh chứng'),
          // _buildSelectUploadFile(),
        ],
      ),
    );
  }

  Widget _buildFromDateInput() {
    return BuildInputTextWithLabel(
      label: 'Từ ngày',
      isRequired: true,
      inputTextModel: InputTextModel(
        controller: controller.fromDateCtrl,
        hintText: PATTERN_1,
        suffixIcon: IconButton(
          onPressed: () async {
            final result = await UtilWidgets.buildDateTimePicker(
              dateTimeInit: convertStringToDateSafe(
                    controller.fromDateCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (result == null) return;
            controller.fromDateCtrl.text =
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

  Widget _buildToDateInput() {
    return BuildInputTextWithLabel(
      label: 'Đến ngày',
      isRequired: true,
      inputTextModel: InputTextModel(
        controller: controller.toDateCtrl,
        hintText: PATTERN_1,
        suffixIcon: IconButton(
          onPressed: () async {
            final result = await UtilWidgets.buildDateTimePicker(
              dateTimeInit: convertStringToDateSafe(
                    controller.toDateCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (result == null) return;
            controller.toDateCtrl.text =
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

  Widget _buildDropdownField() {
    // 1. Mock danh sách loại nghỉ
    final List<String> leaveTypes = [
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
          label: 'Loại nghỉ',
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
                value: controller.leaveTypeSelected.value.isEmpty
                    ? null
                    : controller.leaveTypeSelected.value,
                hint: const Text(
                  'Chọn loại nghỉ',
                  style: TextStyle(fontSize: 14, color: Colors.black38),
                ),
                items: leaveTypes.map((String value) {
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
                    controller.leaveTypeSelected.value = newValue;
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

  Widget _buildCountDayLeave() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabelInput(
          label: 'Tổng số ngày nghỉ',
          isRequired: true,
        ),
        Obx(() {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.grey.shade50,
            ),
            width: double.infinity,
            child: Text(
              controller.totalDays.value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          );
        }),
        sdsSBHeight8,
      ],
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
              offset: const Offset(0, -5))
        ],
      ),
      child: Row(
        children: [
          Expanded(
              child:
                  _buildButton('Đóng', Colors.grey.shade400, () => Get.back())),
          const SizedBox(width: 8),
          const SizedBox(width: 8),
          Expanded(
            child: _buildButton(
              'Gửi phê duyệt',
              const Color(0xFFF97316),
              () => controller.submitLeaveRequest(),
            ),
          ),
        ],
      ),
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

  Widget _buildButton(
    String text,
    Color color,
    VoidCallback onTap,
  ) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12),
        elevation: 0,
      ),
      child: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
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
}
