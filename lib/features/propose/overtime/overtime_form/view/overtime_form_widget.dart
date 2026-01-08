part of 'overtime_form_page.dart';

extension OvertimeFormWidget on OvertimeFormPage {
  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ngày OT
          _buildOvertimeDate(),
          sdsSBHeight12,

          // Giờ bắt đầu và Giờ kết thúc
          Row(
            children: [
              Expanded(
                child: _buildStartHour(),
              ),
              sdsSBWidth12,
              Expanded(
                child: _buildEndHour(),
              ),
            ],
          ),
          sdsSBHeight12,

          // Tổng số giờ
          _buildCountHour(),
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
        controller: controller.overTimeDateCtrl,
        hintText: PATTERN_1,
        suffixIcon: IconButton(
          onPressed: () async {
            final result = await UtilWidgets.buildDateTimePicker(
              dateTimeInit: convertStringToDateSafe(
                    controller.overTimeDateCtrl.text,
                    PATTERN_1,
                  ) ??
                  DateTime.now(),
            );
            if (result == null) return;
            controller.overTimeDateCtrl.text =
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
        controller: controller.startHourCtrl,
        hintText: PATTERN_11,
        isReadOnly: true,
        suffixIcon: IconButton(
          onPressed: () async {
            final result = await UtilWidgets.timePickerUtils(
              initialDate:
                  convertDateToStringSafe(DateTime.now(), PATTERN_11) ?? '',
            );
            if (result == null) return;
            controller.startHourCtrl.text =
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
        controller: controller.toTimeCtrl,
        hintText: PATTERN_11,
        isReadOnly: true,
        suffixIcon: IconButton(
          onPressed: () async {
            final result = await UtilWidgets.timePickerUtils(
              initialDate:
                  convertDateToStringSafe(DateTime.now(), PATTERN_11) ?? '',
            );
            if (result == null) return;
            controller.toTimeCtrl.text =
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

  Widget _buildCountHour() {
    return BuildInputTextWithLabel(
      label: 'Tổng số giờ',
      isRequired: true,
      inputTextModel: InputTextModel(
        controller: controller.countHourCtrl,
        isReadOnly: true,
        hintText: '0.00',
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
              onTap: () {},
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
