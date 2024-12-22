import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/interfaces/recipe_interface.dart';
import 'package:optimally_me_app/features/nutrition/models/recipe_model.dart';
import 'package:optimally_me_app/services/api/api_client.dart';
import 'package:optimally_me_app/services/debounce/debounce.dart';

class RecipeProvider extends Debounce
    with ChangeNotifier
    implements ReceipyInterface {
  final List<Recipe> _recipes = [];
  bool _isLoading = false;

  final int _limit = 10;
  String _q = "";
  int _skip = 0;
  int _page = 1;
  int _total = 0;

  @override
  void initialState() {
    _recipes.clear();
    _isLoading = false;
    _skip = 0;
    _page = 1;
    _total = 0;
  }

  @override
  bool get isLoading => _isLoading;

  @override
  bool get isLastPage => _total == _recipes.length;

  @override
  List<Recipe> get recipes => _recipes;

  @override
  void onSearch(String value) {
    _q = value;
    _skip = 0;
    _page = 1;
    _recipes.clear();
    debounce(
        duration: const Duration(seconds: 1),
        func: () {
          searchRecipes(value);
        });
  }

  @override
  Future<void> searchRecipes(String search) async {
    await ApiClient.init
        .makeCall(null, path: '/recipes/search', queryParameters: {
      "q": search,
      "limit": "$_limit",
      "skip": "$_skip",
    }).then((res) {
      _total = res.total ?? 0;
      _recipes.addAll(res.recipes ?? <Recipe>[]);

      notifyListeners();
    });
  }

  @override
  Future<List<Recipe>> fetchRecipes() async =>
      await ApiClient.init.makeCall(null, path: '/recipes', queryParameters: {
        "limit": "$_limit",
        "skip": "$_skip",
      }).then((res) {
        _total = res.total ?? 0;
        _recipes.addAll(res.recipes ?? <Recipe>[]);
        return _recipes;
      });

  @override
  Future<void> fetchMoreRecipes() async {
    if (isLastPage) return;

    _isLoading = true;
    notifyListeners();

    _page = _page + 1;
    _skip = _limit * (_page - 1);

    var res = await ApiClient.init.makeCall(null,
        path: '/recipes${_q.isNotEmpty ? '/search' : ''}',
        queryParameters: {
          "q": _q,
          "limit": "$_limit",
          "skip": "$_skip",
        });

    _total = res.total ?? 0;

    _recipes.addAll(res.recipes ?? <Recipe>[]);

    _isLoading = false;
    notifyListeners();
  }

  @override
  void bookMarkRecipe(Recipe recipe) {
    recipe.isBookmarked = !(recipe.isBookmarked ?? false);
    notifyListeners();
  }
}
