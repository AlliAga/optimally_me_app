import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/models/recipe_model.dart';

class MealTypeTag extends StatefulWidget {
  final Recipe recipe;

  const MealTypeTag({super.key, required this.recipe});

  @override
  State<MealTypeTag> createState() => _MealTypeTagState();
}

class _MealTypeTagState extends State<MealTypeTag> {
  List<String> get tags =>
      ["Cuisine: ${widget.recipe.cuisine}", ...widget.recipe.mealType ?? []];

  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 200)).then((e) {
      _isLoaded = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 5,
      children: tags.map(
        (tag) {
          int index = tags.indexOf(tag) + 1;

          return AnimatedOpacity(
            opacity: _isLoaded ? 1 : 0,
            duration: Duration(milliseconds: index * 400),
            curve: Curves.easeInBack,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                tag,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
