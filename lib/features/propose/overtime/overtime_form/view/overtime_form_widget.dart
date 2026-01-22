part of 'overtime_form_page.dart';

extension OvertimeFormWidget on OvertimeFormPage {
  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimens.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ngày OT
          _buildOvertimeDate(),
          sdsSBHeight12,

          // Giờ bắt đầu
          _buildStartHour(),
          sdsSBHeight12,

          // Giờ kết thúc
          _buildEndHour(),
          sdsSBHeight12,

          // Lý do
          _buildReasonInput(),
        ],
      ),
    );
  }

  Widget _buildOvertimeDate() {
    return BuildInputTextWithLabel(
      label: 'Ngày OT',
      isRequired: true,
      inputTextModel: InputTextModel(
        controller: controller.otDateCtrl,
        hintText: PATTERN_1,
        suffixIcon: IconButton(
          onPressed: () async {
            final result = await UtilWidgets.buildDateTimePicker(
              dateTimeInit: convertStringToDateSafe(
                    controller.otDateCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (result == null) return;
            controller.otDateCtrl.text =
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

  Widget _buildStartHour() {
    return BuildInputTextWithLabel(
      label: 'Giờ bắt đầu',
      isRequired: true,
      inputTextModel: InputTextModel(
        controller: controller.startTimeCtrl,
        hintText: 'HH:mm',
        isReadOnly: true,
        suffixIcon: IconButton(
          onPressed: () async {
            final result = await UtilWidgets.timePickerUtils(
              initialDate:
                  controller.startTimeCtrl.text.isEmpty
                      ? '08:00'
                      : controller.startTimeCtrl.text,
            );
            if (result == null) return;
            controller.startTimeCtrl.text =
                convertDateToStringSafe(result, PATTERN_11) ?? '';
          },
          icon: Icon(
            Icons.access_time,
            color: AppColors.primary2,
          ),
        ),
      ),
    );
  }

  Widget _buildEndHour() {
    return BuildInputTextWithLabel(
      label: 'Giờ kết thúc',
      isRequired: true,
      inputTextModel: InputTextModel(
        controller: controller.endTimeCtrl,
        hintText: 'HH:mm',
        isReadOnly: true,
        suffixIcon: IconButton(
          onPressed: () async {
            final result = await UtilWidgets.timePickerUtils(
              initialDate:
                  controller.endTimeCtrl.text.isEmpty
                      ? '17:00'
                      : controller.endTimeCtrl.text,
            );
            if (result == null) return;
            controller.endTimeCtrl.text =
                convertDateToStringSafe(result, PATTERN_11) ?? '';
          },
          icon: Icon(
            Icons.access_time,
            color: AppColors.primary2,
          ),
        ),
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
      isRequired: true,
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
              text: 'Đóng',
              color: Colors.grey.shade400,
              onTap: () => Get.back(),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildButton(
              text: 'Gửi phê duyệt',
              color: const Color(0xFFF97316),
              onTap: () => controller.submitOtRequest(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
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
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
