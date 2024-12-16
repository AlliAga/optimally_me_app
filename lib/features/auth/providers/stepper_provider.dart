import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/interfaces/stepper_interface.dart';
import 'package:optimally_me_app/features/auth/screens/step_one_screen.dart';
import 'package:optimally_me_app/features/auth/screens/step_three_screen.dart';
import 'package:optimally_me_app/features/auth/screens/step_two_screen.dart';
import 'package:optimally_me_app/features/home/screens/home_screen.dart';

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
  void onNextStep(BuildContext context) async {
    if (isFinalStep) {
      await Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const HomeScreen()), (r) => false);
      return;
    }

    _currentPageIndex++;
    notifyListeners();
  }

  @override
  void onPreviousStep() {
    _currentPageIndex--;
    notifyListeners();
  }
}
