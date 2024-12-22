import 'package:optimally_me_app/features/nutrition/models/recipe_model.dart';

abstract class ReceipyInterface {
  void initialState();
  bool get isLoading;
  void onSearch(String value);
  bool get isLastPage;
  List<Recipe> get recipes;
  Future<List<Recipe>> fetchRecipes();
  Future<void> fetchMoreRecipes();
  Future<void> searchRecipes(String search);
  void bookMarkRecipe(Recipe recipe);
}
