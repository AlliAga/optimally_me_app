import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/home/widgets/circular_progress_widget.dart';

class CaloryCard extends StatelessWidget {
  const CaloryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Daily calories",
                textScaler: TextScaler.linear(1.5),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(CupertinoIcons.chart_bar),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgress(
                percentage: 90,
                label: "Kcal left",
                secondaryPercentageText: "711",
              ),
              const SizedBox(width: 50),
              Column(
                children: [
                  {"label": "Total kcal", "value": "1222"},
                  {"label": "Goal kcal", "value": "1933"}
                ].map((data) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          data['value'] ?? "",
                          textScaler: const TextScaler.linear(1.8),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['label'] ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
          )
        ],
      ),
    );
  }
}
