import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/interfaces/step_two_interaface.dart';
import 'package:optimally_me_app/features/auth/models/health_goal_model.dart';

class StepTwoProvider extends ChangeNotifier implements StepTwoInteraface {
  final List<HealthGoal> _healthGoals = [
    HealthGoal(
      icon: Icons.gpp_good_rounded,
      label: "General Wellness",
      isSelected: true,
    ),
    HealthGoal(
      icon: Icons.accessibility_new,
      label: "Balance hormones",
      isSelected: false,
    ),
    HealthGoal(
      icon: Icons.alarm,
      label: "Improve sleep",
      isSelected: false,
    ),
    HealthGoal(
      icon: Icons.energy_savings_leaf,
      label: "Boost energy",
      isSelected: false,
    ),
    HealthGoal(
      icon: Icons.healing,
      label: "Improve mental health",
      isSelected: false,
    ),
    HealthGoal(
      icon: Icons.person,
      label: "Improve nutrition",
      isSelected: false,
    ),
  ];

  @override
  List<HealthGoal> get healthGoals => _healthGoals;

  @override
  bool get selectionCondition =>
      _healthGoals
          .where((healthGoal) => healthGoal.isSelected)
          .toList()
          .length ==
      3;

  @override
  void selectDeselectHealthGoals(HealthGoal healthGoal) {
    if (selectionCondition && !healthGoal.isSelected) return;

    healthGoal.isSelected = !healthGoal.isSelected;
    notifyListeners();
  }
}
