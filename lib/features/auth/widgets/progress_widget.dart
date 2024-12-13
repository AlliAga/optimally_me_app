import 'package:flutter/material.dart';
import 'package:optimally_me_app/widgets/progress_bar_widget.dart';

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
          ProgressBar(percentage: percentage),
          Text("$percentage%"),
        ],
      ),
    );
  }
}
