import 'package:optimally_me_app/features/nutrition/models/recipe_model.dart';

abstract class ReceipyInterface {
  void onSearch(String value);
  int get page;
  bool get isLastPage;
  void nextPage();
  Future<List<Recipe>> recipes();
  void bookMarkRecipe(Recipe recipe);
}
