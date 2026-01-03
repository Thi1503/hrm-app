import 'package:flutter/material.dart';

Widget buildCircleIcon({required Color color}) {
  return Container(
    width: 8,
    height: 8,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  );
}
