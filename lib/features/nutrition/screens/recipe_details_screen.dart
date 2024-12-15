import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/models/recipe_model.dart';
import 'package:optimally_me_app/features/nutrition/providers/recipe_provider.dart';
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
          Hero(
            key: Key("${recipe.id}"),
            tag: "${recipe.id}",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                height: 350,
                fit: BoxFit.cover,
                recipe.image,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Wrap(
                    runSpacing: 12,
                    children: [...recipe.tags, "+4"]
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
                  recipe.name,
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
                      "BBy Optimally Me",
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
