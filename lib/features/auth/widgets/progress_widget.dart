import 'package:flutter/material.dart';

class FormProgressBar extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final int percentage;

  const FormProgressBar({
    super.key,
    this.padding,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LinearProgressIndicator(
            minHeight: 6,
            value: percentage / 100,
            backgroundColor: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15),
          ),
          Text("$percentage%")
        ],
      ),
    );
  }
}
