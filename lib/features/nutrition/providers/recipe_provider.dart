import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/interfaces/recipe_interface.dart';
import 'package:optimally_me_app/features/nutrition/models/recipe_model.dart';
import 'package:optimally_me_app/services/api/api_client.dart';

class RecipeProvider extends ChangeNotifier implements ReceipyInterface {
  final List<Recipe> _recipes = [];
  String _q = "";
  int _page = 1;
  int _skip = 1;
  int _total = 0;

  @override
  int get page => _page;

  @override
  bool get isLastPage => _total == _skip;

  @override
  void onSearch(String value) {
    if (_q.isNotEmpty) {
      _skip = 0;
      _page = 1;
      _recipes.clear();
    }

    _q = value;
    log(_q);
    notifyListeners();
  }

  @override
  void nextPage() {
    if (isLastPage) return;

    _page = _page + 1;
    notifyListeners();
  }

  @override
  Future<List<Recipe>> recipes() async {
    log("...FETCHINg");
    int limit = 10;
    _skip = limit * (page - 1);

    if (_skip == 0) {
      _recipes.clear();
    }

    var res = await ApiClient.init
        .makeCall(null, path: '/recipes/search', queryParameters: {
      "q": _q,
      "limit": "$limit",
      "skip": "$_skip",
    });
    _total = res.total ?? 0;

    log("$limit, $_skip, ${res.total}");

    if (!isLastPage) {
      _recipes.addAll(res.recipes ?? <Recipe>[]);
    }

    return _recipes;
  }

  @override
  void bookMarkRecipe(Recipe recipe) {
    recipe.isBookmarked = !(recipe.isBookmarked ?? false);
    notifyListeners();
  }
}
