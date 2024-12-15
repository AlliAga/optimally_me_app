import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/providers/meal_plan_provider.dart';
import 'package:optimally_me_app/features/nutrition/screens/food_list_screen.dart';
import 'package:optimally_me_app/features/nutrition/widgets/food_category_card_widget.dart';
import 'package:optimally_me_app/widgets/bottom_model_widget.dart';
import 'package:optimally_me_app/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class FoodCategoryPopup extends StatelessWidget {
  const FoodCategoryPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomModalLayout(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What do you want to add?",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Consumer<MealPlanProvider>(
                builder: (context, provider, widget) {
                  return ListView.builder(
                    itemCount: provider.foodCategories.length,
                    itemBuilder: (context, index) {
                      return FoodCategoryCard(
                        foodCategory: provider.foodCategories[index],
                      );
                    },
                  );
                },
              ),
            ),
            Consumer<MealPlanProvider>(builder: (context, provider, widget) {
              return FormButton(
                onPressed: provider.isNoneFoodCategorySeleced
                    ? null
                    : () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const FoodListScreen(),
                          ),
                        );
                      },
                text: "Confirm",
              );
            }),
          ],
        ),
      ),
    );
  }
}
