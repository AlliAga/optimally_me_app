import 'package:flutter/material.dart';

abstract class StepperInterface {
  int get currentPageIndex;
  List<Widget> get stepperScreens;
  int get stepperProgressPercentage;
  bool get isInitialStep;
  bool get isFinalStep;
  void onNextStep(BuildContext context);
  void onPreviousStep();
}
