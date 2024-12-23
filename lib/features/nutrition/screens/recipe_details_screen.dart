import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/models/recipe_model.dart';
import 'package:optimally_me_app/features/nutrition/providers/recipe_provider.dart';
import 'package:optimally_me_app/features/nutrition/widgets/difficulty_tag_widget.dart';
import 'package:optimally_me_app/features/nutrition/widgets/meal_type_tag_widget.dart';
import 'package:optimally_me_app/features/nutrition/widgets/tag_chip_widget.dart';
import 'package:optimally_me_app/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          LayoutBuilder(
            builder: (context, box) {
              return Stack(
                children: [
                  Hero(
                    key: Key("${recipe.id}"),
                    tag: "${recipe.id}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        width: box.maxWidth,
                        height: 350,
                        fit: BoxFit.cover,
                        recipe.image ?? "",
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: SizedBox(
                      width: box.maxWidth / 1.5,
                      child: MealTypeTag(recipe: recipe),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: DifficultyTag(difficulty: recipe.difficulty ?? ""),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Wrap(
                      spacing: 10,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.75),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "${recipe.rating}",
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.75),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.reviews,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Reviews (${recipe.reviewCount})",
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Wrap(
                    runSpacing: 12,
                    children: (recipe.tags ?? [])
                        .map(
                          (e) => TagChip(text: e),
                        )
                        .toList(),
                  ),
                ),
                const Spacer(),
                const SizedBox(width: 15),
                Consumer<RecipeProvider>(
                    builder: (context, recipeProvider, widget) {
                  return IconButton(
                    onPressed: () => recipeProvider.bookMarkRecipe(recipe),
                    icon: Icon(
                      recipe.isBookmarked ?? false
                          ? Icons.bookmark
                          : Icons.bookmark_outline,
                    ),
                  );
                })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Instructions",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 15),
                ...(recipe.instructions ?? []).map((instrcution) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            instrcution,
                            style: const TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 15),
                ...(recipe.ingredients ?? []).map((instrcution) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.star_border,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              instrcution,
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name ?? "",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ipsum recusandae saepe perferendis aliquam consequuntur eaque iusto, eos aut beatae consequatur facilis provident commodi at dolore quis unde doloremque sint fuga laborum ducimus deserunt quasi quibusdam alias? Cupiditate beatae blanditiis quas quisquam ipsam quod necessitatibus accusantium! Excepturi accusamus sint a architecto veniam.",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "By Optimally Me",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "|",
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.titleSmall?.fontSize,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "10 Oct 2023",
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.titleSmall?.fontSize,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FormButton(
          text: "Add to plan",
          onPressed: () {},
        ),
      ),
    );
  }
}
