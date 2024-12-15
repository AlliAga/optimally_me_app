import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/interfaces/recipe_interface.dart';
import 'package:optimally_me_app/features/nutrition/models/recipe_model.dart';

class RecipeProvider extends ChangeNotifier implements ReceipyInterface {
  final List<Recipe> _recipes = [
    Recipe(
      id: 1,
      image: "assets/images/recipes/recipe-1.png",
      name: "Whole grain Pancakes with Maple Syrup",
      tags: ["Vegetarian", "Low-fat", "antioxidant-Packed"],
      minutes: 15,
      servings: 2,
      isBookmarked: true,
    ),
    Recipe(
      id: 2,
      image: "assets/images/recipes/recipe-2.jpg",
      name: "Zesty Quinoa Salad Delight",
      tags: ["High-Fibre", "Low-fat", "antioxidant-Packed"],
      minutes: 20,
      servings: 2,
      isBookmarked: true,
    ),
    Recipe(
      id: 3,
      image: "assets/images/recipes/recipe-3.jpg",
      name: "Dill-Crusted Salmon & Roasted Veggies",
      tags: ["Antioxidant", "Low-fat", "antioxidant-Packed"],
      minutes: 45,
      servings: 2,
    ),
    Recipe(
      id: 4,
      tags: ["Vegetarian", "Low-fat", "antioxidant-Packed"],
      image: "assets/images/recipes/recipe-4.jpg",
      name: "Strawberry Pancakes",
      minutes: 15,
      servings: 2,
    ),
  ];

  @override
  List<Recipe> get recipes => _recipes;

  @override
  void bookMarkRecipe(Recipe recipe) {
    recipe.isBookmarked = !(recipe.isBookmarked ?? false);
    notifyListeners();
  }
}
