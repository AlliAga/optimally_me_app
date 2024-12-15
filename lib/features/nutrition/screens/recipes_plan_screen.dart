import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/models/recipe_model.dart';
import 'package:optimally_me_app/features/nutrition/providers/recipe_provider.dart';
import 'package:optimally_me_app/features/nutrition/widgets/recipe_card_widget.dart';
import 'package:provider/provider.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(builder: (context, recipeProvider, widget) {
      List<Recipe> recipes = recipeProvider.recipes;

      return ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(
            recipe: recipes[index],
          );
        },
      );
    });
  }
}
