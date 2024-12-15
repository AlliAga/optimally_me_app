import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/models/food_category_model.dart';
import 'package:optimally_me_app/features/nutrition/providers/meal_plan_provider.dart';
import 'package:optimally_me_app/widgets/circular_checkbox_widget.dart';
import 'package:provider/provider.dart';

class FoodCategoryCard extends StatelessWidget {
  final FoodCategory foodCategory;

  const FoodCategoryCard({super.key, required this.foodCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              foodCategory.icon,
              color: foodCategory.color,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            foodCategory.text,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Spacer(),
          Consumer<MealPlanProvider>(builder: (context, provider, widget) {
            return CircularCheckbox(
              onTap: () => provider.selectDeselectFoodCategory(foodCategory),
              isSelected: foodCategory.isSelected ?? false,
            );
          }),
        ],
      ),
    );
  }
}
