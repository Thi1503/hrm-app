import 'package:do_an_application/base/base.dart';
import 'package:do_an_application/features/notification/model/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationController extends BaseGetxController {
  final List<NotificationModel> notifications = [
    // NotificationModel(
    //   title: 'Chấm công khuôn mặt',
    //   content: 'Dữ liệu chấm công vào lúc 07:59 06/01/2026 hợp lệ',
    //   time: '6 giờ trước',
    //   icon: Icons.face_retouching_natural,
    //   iconColor: Colors.orange,
    // ),
    // NotificationModel(
    //   title: 'Chấm công khuôn mặt',
    //   content: 'Dữ liệu chấm công ra lúc 17:35 05/01/2026 hợp lệ',
    //   time: '21 giờ trước',
    //   icon: Icons.face_retouching_natural,
    //   iconColor: Colors.orange,
    // ),
    NotificationModel(
      title: 'Giải trình chấm công',
      content:
          'Đơn giải trình chấm công ngày 29/12/2025  của bạn đã được nhân sự xác nhận',
      time: '1 ngày trước',
      icon: Icons.description_outlined,
      iconColor: Colors.blue,
    ),
    NotificationModel(
      title: 'Giải trình chấm công',
      content:
          'Đơn giải trình chấm công ngày 29/12/2025 của bạn đã được Trưởng Phòng Phần mềm Mobile Hà Văn Lộc (NS0052) phê duyệt. Đang chờ nhân sự xác nhận',
      time: '1 ngày trước',
      icon: Icons.description_outlined,
      iconColor: Colors.blue,
    ),
    // NotificationModel(
    //   title: 'Giải trình chấm công',
    //   content:
    //       'Đơn giải trình chấm công ngày 02/01/2026 của bạn đã được Trưởng Phòng Phần mềm Mobile Hà Văn Lộc (NS0052) phê duyệt. Đang chờ nhân sự xác nhận',
    //   time: '1 ngày trước',
    //   icon: Icons.description_outlined,
    //   iconColor: Colors.blue,
    //   isUnread: false, // Item này màu xám nhạt trong ảnh
    // ),
    // NotificationModel(
    //   title: 'Làm thêm giờ',
    //   content: 'Đơn đăng ký làm thêm ngày 30/12/2025',
    //   time: '3 ngày trước',
    //   icon: Icons.assignment_turned_in_outlined,
    //   iconColor: Colors.blue,
    // ),
  ];
}
