import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/interfaces/stepper_interface.dart';
import 'package:optimally_me_app/features/auth/models/dietary_model.dart';
import 'package:optimally_me_app/features/auth/models/health_goal_model.dart';
import 'package:optimally_me_app/features/auth/screens/step_one_screen.dart';
import 'package:optimally_me_app/features/auth/screens/step_three_screen.dart';
import 'package:optimally_me_app/features/auth/screens/step_two_screen.dart';

class StepperProvider extends ChangeNotifier implements StepperInterface {
  int _currentPageIndex = 0;

  @override
  int get currentPageIndex => _currentPageIndex;

  @override
  List<Widget> get stepperScreens => const [
        StepOneScreen(),
        StepTwoScreen(),
        StepThreeScreen(),
      ];

  @override
  bool get isInitialStep => currentPageIndex == 0;

  @override
  bool get isFinalStep => currentPageIndex == (stepperScreens.length - 1);

  @override
  int get stepperProgressPercentage {
    switch (currentPageIndex) {
      case 1:
        return 32;
      case 2:
        return 40;
      default:
        return 0;
    }
  }

  @override
  void onNextStep() {
    if (isFinalStep) return;

    _currentPageIndex++;
    notifyListeners();
  }

  @override
  void onPreviousStep() {
    _currentPageIndex--;
    notifyListeners();
  }

  @override
  List<HealthGoal> get healthGoals => [
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
          isSelected: true,
        ),
        HealthGoal(
          icon: Icons.energy_savings_leaf,
          label: "Boost energy",
          isSelected: true,
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
  List<Dietary> get dietaries => [
        Dietary(
          icon: Icons.not_accessible,
          label: "No Preference",
          isSelected: false,
        ),
        Dietary(
          icon: Icons.format_color_text,
          label: "Flexiterian",
          isSelected: false,
        ),
        Dietary(
          icon: Icons.line_weight,
          label: "Kilo/Low Carbs",
          isSelected: true,
        ),
        Dietary(
          icon: Icons.food_bank,
          label: "Mediterranean",
          isSelected: false,
        ),
        Dietary(
          icon: Icons.color_lens,
          label: "Paleo",
          isSelected: false,
        ),
        Dietary(
          icon: Icons.online_prediction,
          label: "Pescaterian",
          isSelected: false,
        ),
      ];
}
