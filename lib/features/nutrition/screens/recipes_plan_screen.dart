import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/models/recipe_model.dart';
import 'package:optimally_me_app/features/nutrition/providers/recipe_provider.dart';
import 'package:optimally_me_app/features/nutrition/widgets/recipe_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    context.read<RecipeProvider>().initialState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context.read<RecipeProvider>().fetchMoreRecipes();
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              isDense: true,
              hintText: "Search recipe",
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              filled: true,
              fillColor: Colors.grey.withOpacity(.2),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              ),
            ),
            onChanged: (value) =>
                context.read<RecipeProvider>().onSearch(value),
          ),
        ),
        FutureBuilder<List<Recipe>>(
            future: context.read<RecipeProvider>().fetchRecipes(),
            builder: (context, snapshot) {
              return Consumer<RecipeProvider>(
                  builder: (context, recipeProvider, widget) {
                List<Recipe> recipes = recipeProvider.recipes;

                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                if (!snapshot.hasData) {
                  return Expanded(
                    child: Skeletonizer(
                      enabled: true,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return RecipeCard(
                            recipe: Recipe(
                              image: "https://freesvg.org/img/Placeholder.png",
                              name: "Thejsjdkjd",
                              servings: 1,
                              tags: ["sdisjd", "sdksjd"],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: recipes.length,
                          itemBuilder: (context, index) {
                            return RecipeCard(
                              recipe: recipes[index],
                            );
                          },
                        ),
                      ),
                      recipeProvider.isLoading
                          ? Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              color: Theme.of(context).primaryColor,
                              child: const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Loading More...",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ))
                          : const SizedBox.shrink(),
                    ],
                  ),
                );
              });
            }),
      ],
    );
  }
}
