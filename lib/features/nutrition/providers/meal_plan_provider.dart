import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/interfaces/meal_plan_interface.dart';
import 'package:optimally_me_app/features/nutrition/models/breakfast_model.dart';

class MealPlanProvider extends ChangeNotifier implements MealPlanInterface {
  final List<Breakfast> _breakfasts = [
    Breakfast(
      id: 1,
      image: "assets/images/recipes/recipe-1.png",
      name: "Oatmeal with fresh berries and Almonds",
      tags: ["High-protein"],
      kcal: 369,
      servings: 2,
    ),
    Breakfast(
      id: 2,
      image: "assets/images/recipes/recipe-2.jpg",
      name: "Classic Avocado Toast with Poached Egg",
      tags: ["Heart-Healthy"],
      kcal: 400,
      servings: 1,
    ),
    Breakfast(
      id: 3,
      image: "assets/images/recipes/recipe-3.jpg",
      name: "Oatmeal smoothie",
      tags: ["Gluten-Free"],
      kcal: 392,
      servings: 1,
    ),
    Breakfast(
      id: 4,
      tags: ["Gluten-Free"],
      image: "assets/images/recipes/recipe-4.jpg",
      name: "Oatmeal banana pancakes",
      kcal: 212,
      servings: 1,
    ),
  ];

  @override
  List<Breakfast> get breakfasts => _breakfasts;

  @override
  void selectDeselectBreakFast(Breakfast breakfast) {
    breakfast.isSelected = !(breakfast.isSelected ?? false);
    notifyListeners();
  }
}
