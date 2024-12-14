import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/home/interfaces/home_interface.dart';
import 'package:optimally_me_app/features/home/models/nav_option.dart';
import 'package:optimally_me_app/features/home/screens/lifestyle_screen.dart';
import 'package:optimally_me_app/features/nutrition/screens/nutrition_screen.dart';

class HomeProvider extends ChangeNotifier implements HomeInterface {
  int _currentNavigationIndex = 0;

  @override
  List<NavOption> get navptions => [
        NavOption(index: 0, icon: Icons.grid_view_outlined, text: "Lifestyle"),
        NavOption(
            index: 1,
            icon: Icons.health_and_safety_outlined,
            text: "Nutrition"),
        NavOption(
            index: 2, icon: Icons.fitness_center_outlined, text: "Fitness"),
        NavOption(index: 3, icon: Icons.food_bank_outlined, text: "Wellness"),
        NavOption(index: 4, icon: Icons.menu, text: "Menu"),
      ];

  @override
  List<Widget> get screens => const [
        LifestyleScreen(),
        NutritionScreen(),
        LifestyleScreen(),
        LifestyleScreen(),
        LifestyleScreen(),
      ];

  @override
  int get currentNavigationIndex => _currentNavigationIndex;

  @override
  void onNavigationIndexChanged(int index) {
    _currentNavigationIndex = index;
    notifyListeners();
  }
}
