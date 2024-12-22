import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/models/recipe_model.dart';
import 'package:optimally_me_app/features/nutrition/providers/recipe_provider.dart';
import 'package:optimally_me_app/features/nutrition/screens/recipe_details_screen.dart';
import 'package:optimally_me_app/features/nutrition/widgets/tag_chip_widget.dart';
import 'package:provider/provider.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => RecipeDetailsScreen(
                    recipe: recipe,
                  ))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 8,
              spreadRadius: -10,
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Hero(
                  key: Key("${recipe.id}"),
                  tag: "${recipe.id}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      width: 125,
                      height: 125,
                      fit: BoxFit.cover,
                      recipe.image ?? "",
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 125,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...[
                              recipe.tags![0],
                              "+${(recipe.tags ?? []).length - 1}"
                            ].map(
                              (e) => TagChip(text: e),
                            ),
                            const Spacer(),
                            Consumer<RecipeProvider>(
                                builder: (context, recipeProvider, widget) {
                              return InkWell(
                                onTap: () =>
                                    recipeProvider.bookMarkRecipe(recipe),
                                child: Icon(
                                  recipe.isBookmarked ?? false
                                      ? Icons.bookmark
                                      : Icons.bookmark_outline,
                                ),
                              );
                            })
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                recipe.name ?? "",
                                textScaler: const TextScaler.linear(1.25),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            {
                              "icon": CupertinoIcons.clock,
                              "text": "${recipe.prepTimeMinutes} min"
                            },
                            {
                              "icon": CupertinoIcons.person,
                              "text": "${recipe.servings} Serving"
                            }
                          ]
                              .map((data) => Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        (data['icon'] ?? Icons.abc)
                                            as IconData?,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "${data['text']}",
                                        style: const TextStyle(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      const SizedBox(width: 8)
                                    ],
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 5)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              'By Optimally Me',
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
      ),
    );
  }
}
