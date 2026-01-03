import 'package:flutter/material.dart';

extension FormKeyExt on GlobalKey<FormState> {
  bool get isValid {
    return currentState?.validate() == true;
  }
}
