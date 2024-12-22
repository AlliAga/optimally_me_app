import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/models/recipe_model.dart';
import 'package:optimally_me_app/features/nutrition/providers/recipe_provider.dart';
import 'package:optimally_me_app/features/nutrition/widgets/recipe_card_widget.dart';
import 'package:provider/provider.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context.read<RecipeProvider>().nextPage();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: (value) => context.read<RecipeProvider>().onSearch(value),
        ),
        Consumer<RecipeProvider>(builder: (context, recipeProvider, widget) {
          return FutureBuilder<List<Recipe>>(
              future: recipeProvider.recipes(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                if (!snapshot.hasData) {
                  return const LinearProgressIndicator();
                }

                List<Recipe> recipes = snapshot.data ?? <Recipe>[];

                return Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      return RecipeCard(
                        recipe: recipes[index],
                      );
                    },
                  ),
                );
              });
        }),
      ],
    );
  }
}
