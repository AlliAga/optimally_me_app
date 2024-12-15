import 'package:optimally_me_app/features/nutrition/models/food_category_model.dart';

class Meal {
  int id;
  String image;
  String name;
  List<String> tags;
  int servings;
  int kcal;
  FoodCategory category;
  bool? isSelected;

  Meal({
    required this.id,
    required this.image,
    required this.name,
    required this.tags,
    required this.servings,
    required this.kcal,
    required this.category,
    this.isSelected = false,
  });
}
