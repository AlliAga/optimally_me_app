import 'package:flutter/material.dart';

class AppStyle {
  static final AppStyle _instance = AppStyle._internal();

  factory AppStyle() {
    return _instance;
  }

  AppStyle._internal();

  factory AppStyle.getInstance() => _instance;

  Color get primaryColorDark => const Color(0x0fffffff);
  Color get scaffoldBackgroundColor => const Color(0xffffffff);
  Color get secondaryColor => const Color(0xFFE7595B);
}
