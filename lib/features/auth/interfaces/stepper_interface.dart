import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/models/dietary_model.dart';
import 'package:optimally_me_app/features/auth/models/health_goal_model.dart';

abstract class StepperInterface {
  int get currentPageIndex;
  List<Widget> get stepperScreens;
  int get stepperProgressPercentage;
  bool get isInitialStep;
  bool get isFinalStep;
  void onNextStep();
  void onPreviousStep();
  List<HealthGoal> get healthGoals;
  List<Dietary> get dietaries;
}
