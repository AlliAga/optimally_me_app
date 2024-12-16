import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/interfaces/step_three_interface.dart';
import 'package:optimally_me_app/features/auth/models/dietary_model.dart';

class StepThreeProvider extends ChangeNotifier implements StepThreeInterface {
  final List<Dietary> _dietaries = [
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

  @override
  List<Dietary> get dietaries => _dietaries;

  @override
  void selectDeselectDietary(Dietary dietary) {
    for (int i = 0; i < _dietaries.length; i++) {
      _dietaries[i].isSelected = false;
    }
    dietary.isSelected = !dietary.isSelected;
    notifyListeners();
  }
}
