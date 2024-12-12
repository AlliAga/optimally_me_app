import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/models/health_goal_model.dart';

class HealthGoalCard extends StatelessWidget {
  final HealthGoal healthGoal;

  const HealthGoalCard({super.key, required this.healthGoal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: healthGoal.isSelected ? const Color(0xFF062021) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 0.2,
        ),
      ),
      child: ListTile(
        leading: Icon(
          healthGoal.icon,
          size: 28,
          color: healthGoal.isSelected ? Colors.white : const Color(0xFF062021),
        ),
        title: Text(
          healthGoal.label,
          style: TextStyle(
            fontSize: 16,
            color:
                healthGoal.isSelected ? Colors.white : const Color(0xFF062021),
          ),
        ),
      ),
    );
  }
}
