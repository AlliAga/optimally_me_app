import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/home/models/feeling_model.dart';

class FeelingBoxCard extends StatelessWidget {
  final Feeling feeling;
  final void Function()? onTap;
  const FeelingBoxCard({super.key, required this.feeling, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 100,
        decoration: BoxDecoration(
          color: feeling.isSelected ?? false ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: Colors.grey.shade400,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              feeling.emoji,
              textScaler: const TextScaler.linear(2.25),
            ),
            const SizedBox(height: 5),
            Text(
              feeling.label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color:
                    feeling.isSelected ?? false ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
