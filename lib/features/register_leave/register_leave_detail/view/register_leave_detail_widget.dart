part of 'register_leave_detail_page.dart';

extension RegisterLeaveDetailWidget on RegisterLeaveDetailPage {
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text(
        'Đăng ký nghỉ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.colorHeadPayroll,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateField(
            label: 'Từ ngày',
            isRequired: true,
            controller: controller.toDateCtrl,
          ),
          _buildDateField(
            label: 'Đến ngày',
            isRequired: true,
            controller: controller.fromDateCtrl,
          ),
          _buildDropdownField(
              label: 'Loại nghỉ', hint: 'Kiểu công', isRequired: true),
          _buildLabel('Tổng số ngày nghỉ', isRequired: true),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: _buildTextField(
                  hint: '0.0',
                  enabled: true, // Cho phép nhập
                ),
              ),
              const SizedBox(width: 16), // Thay sdsSBWidth16 nếu bị lỗi
            ],
          ),
          _buildLabel('Lý do'),
          _buildTextField(hint: 'Nhập lý do...', maxLines: 4),
          _buildLabel('File minh chứng'),
          _buildSelectUploadFile(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // 3. Thanh nút bấm dưới cùng (Sticky Footer)
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
              () {},
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET HỖ TRỢ (Helper Widgets) ---

  Widget _buildLabel(String label, {bool isRequired = false}) {
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
                      text: ' (*)', style: TextStyle(color: Colors.red))
                ]
              : [],
        ),
      ),
    );
  }

  Widget _buildTextField({
    String? label,
    String? hint,
    TextEditingController? controller,
    Widget? suffixIcon,
    bool enabled = true,
    bool readOnly = false,
    int maxLines = 1,
    VoidCallback? onTap,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) _buildLabel(label),
        TextField(
          controller: controller,
          maxLines: maxLines,
          readOnly: readOnly,
          enabled: enabled,
          onTap: onTap,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: enabled ? Colors.white : Colors.grey.shade100,
            suffixIcon: suffixIcon,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300)),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildDateField({
    required String label,
    bool isRequired = false,
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label, isRequired: isRequired),
        _buildTextField(
          controller: controller,
          hint: PATTERN_1,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            DateInputFormatter(),
          ],
          readOnly: false,
          suffixIcon: Icon(
            Icons.calendar_month,
            color: AppColors.primary2,
          ),
          onTap: () async {},
        ),
      ],
    );
  }

  Widget _buildDropdownField(
      {required String label, required String hint, bool isRequired = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label, isRequired: isRequired),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(hint, style: const TextStyle(fontSize: 14)),
              items: [],
              onChanged: (_) {},
            ),
          ),
        ),
        const SizedBox(height: 8),
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
