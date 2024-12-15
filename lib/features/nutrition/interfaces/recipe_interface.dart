import 'package:optimally_me_app/features/nutrition/models/recipe_model.dart';

abstract class ReceipyInterface {
  List<Recipe> get recipes;
  void bookMarkRecipe(Recipe recipe);
}
