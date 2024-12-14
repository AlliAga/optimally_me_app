import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/widgets/recipe_card_widget.dart';

class ReceipiesScreen extends StatelessWidget {
  const ReceipiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const RecipeCard();
      },
    );
  }
}
