import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final int percentage;
  final String? secondaryPercentageText;
  final String label;
  const CircularProgress(
      {super.key,
      required this.percentage,
      this.secondaryPercentageText,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 150,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: percentage / 100,
            strokeWidth: 8,
            strokeCap: StrokeCap.round,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                secondaryPercentageText ?? "$percentage%",
                textScaler: const TextScaler.linear(3),
              ),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
