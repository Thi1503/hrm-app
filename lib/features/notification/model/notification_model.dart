import 'package:flutter/cupertino.dart';

class NotificationModel {
  final String title;
  final String content;
  final String time;
  final IconData icon;
  final Color iconColor;
  final bool isUnread;

  NotificationModel({
    required this.title,
    required this.content,
    required this.time,
    required this.icon,
    required this.iconColor,
    this.isUnread = true,
  });
}
