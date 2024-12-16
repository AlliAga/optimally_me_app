import 'package:flutter/material.dart';

class DeviceData {
  int priority;
  IconData icon;
  String text;
  bool? isSelected;

  DeviceData({
    required this.priority,
    required this.icon,
    required this.text,
    this.isSelected = false,
  });
}
