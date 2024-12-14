import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/interfaces/step_one_interface.dart';

class StepOneProvider extends ChangeNotifier implements StepOneInterface {
  int _currentWeightOptionIndex = 0;

  @override
  void onWeightOptingIndexChange(int index) {
    _currentWeightOptionIndex = index;
    notifyListeners();
  }

  @override
  int get weightOptionIndex => _currentWeightOptionIndex;
}
