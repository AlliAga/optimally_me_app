import 'package:optimally_me_app/features/nutrition/models/meal_model.dart';
import 'package:optimally_me_app/features/nutrition/models/food_category_model.dart';

abstract class MealPlanInterface {
  List<Meal> meals(String category);
  List<Meal> selectedMeals(String category);
  void selectDeselectMeal(Meal breakfast);
  bool get isNoneFoodCategorySeleced;
  List<FoodCategory> get foodCategories;
  FoodCategory get selectedFoodCategory;
  void selectDeselectFoodCategory(FoodCategory foodCategory);
}
