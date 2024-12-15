import 'package:flutter/material.dart';

class FoodCategory {
  IconData? icon;
  String text;
  Color? color;
  bool? isSelected;

  FoodCategory({
    this.icon,
    required this.text,
    this.color,
    this.isSelected = false,
  });
}
