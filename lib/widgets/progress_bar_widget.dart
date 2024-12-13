import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int percentage;

  const ProgressBar({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 6,
      value: percentage / 100,
      backgroundColor: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(15),
    );
  }
}
