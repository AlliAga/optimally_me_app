import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/interfaces/meal_plan_interface.dart';
import 'package:optimally_me_app/features/nutrition/models/meal_model.dart';
import 'package:optimally_me_app/features/nutrition/models/food_category_model.dart';

class MealPlanProvider extends ChangeNotifier implements MealPlanInterface {
  final List<Meal> _meals = [
    Meal(
      id: 1,
      image: "assets/images/recipes/recipe-1.png",
      name: "Oatmeal with fresh berries and Almonds",
      tags: ["High-protein"],
      category: FoodCategory(text: "Breakfast"),
      kcal: 369,
      servings: 2,
    ),
    Meal(
      id: 2,
      image: "assets/images/recipes/recipe-2.jpg",
      name: "Classic Avocado Toast with Poached Egg",
      tags: ["Heart-Healthy"],
      category: FoodCategory(text: "Breakfast"),
      kcal: 400,
      servings: 1,
    ),
    Meal(
      id: 3,
      image: "assets/images/recipes/recipe-3.jpg",
      name: "Oatmeal smoothie",
      tags: ["Gluten-Free"],
      category: FoodCategory(text: "Lunch"),
      kcal: 392,
      servings: 1,
    ),
    Meal(
      id: 4,
      tags: ["Gluten-Free"],
      image: "assets/images/recipes/recipe-4.jpg",
      name: "Oatmeal banana pancakes",
      category: FoodCategory(text: "Dinner"),
      kcal: 212,
      servings: 1,
    ),
  ];

  final List<FoodCategory> _foodCategories = [
    FoodCategory(
        icon: Icons.free_breakfast, color: Colors.green, text: "Breakfast"),
    FoodCategory(icon: Icons.lunch_dining, color: Colors.orange, text: "Lunch"),
    FoodCategory(
        icon: Icons.dinner_dining, color: Colors.brown, text: "Dinner"),
    FoodCategory(
      icon: Icons.breakfast_dining,
      color: Colors.yellow.shade700,
      text: "Snack",
    ),
  ];

  @override
  List<Meal> selectedMeals(String category) => _meals
      .where((meal) =>
          (meal.isSelected ?? false) && meal.category.text == category)
      .toList();

  @override
  List<Meal> meals(String category) =>
      _meals.where((meal) => meal.category.text == category).toList();

  @override
  void selectDeselectMeal(Meal meal) {
    meal.isSelected = !(meal.isSelected ?? false);
    notifyListeners();
  }

  @override
  bool get isNoneFoodCategorySeleced =>
      !_foodCategories.any((foodCategory) => foodCategory.isSelected ?? false);

  @override
  List<FoodCategory> get foodCategories => _foodCategories;

  @override
  FoodCategory get selectedFoodCategory => _foodCategories
      .firstWhere((foodCategory) => foodCategory.isSelected ?? false);

  @override
  void selectDeselectFoodCategory(FoodCategory foodCategory) {
    for (int i = 0; i < _foodCategories.length; i++) {
      _foodCategories[i].isSelected = false;
    }
    foodCategory.isSelected = !(foodCategory.isSelected ?? false);
    notifyListeners();
  }
}
