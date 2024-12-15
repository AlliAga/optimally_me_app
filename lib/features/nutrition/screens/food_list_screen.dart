import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/models/meal_model.dart';
import 'package:optimally_me_app/features/nutrition/providers/meal_plan_provider.dart';
import 'package:provider/provider.dart';

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Consumer<MealPlanProvider>(builder: (context, provider, widget) {
          return Text(provider.selectedFoodCategory.text);
        }),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: Consumer<MealPlanProvider>(builder: (context, provider, widget) {
        return ListView.builder(
          itemCount: provider.meals(provider.selectedFoodCategory.text).length,
          itemBuilder: (context, index) {
            Meal meal =
                provider.meals(provider.selectedFoodCategory.text)[index];
            bool isSelected = meal.isSelected ?? false;
            return Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      meal.image,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                              meal.name,
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            )),
                            const SizedBox(width: 10),
                            Consumer<MealPlanProvider>(
                              builder: (context, provider, widget) {
                                return GestureDetector(
                                  onTap: () =>
                                      provider.selectDeselectMeal(meal),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 0.5),
                                      color: isSelected
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    child: Icon(
                                      isSelected ? Icons.check : Icons.add,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            {
                              "icon": Icons.person_outline,
                              "text": "${meal.servings} servings"
                            },
                            {
                              "icon": Icons.calculate_outlined,
                              "text": "${meal.kcal} kcal"
                            },
                          ]
                              .map(
                                (data) => Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Icon(data['icon'] as IconData),
                                      const SizedBox(width: 5),
                                      Text(
                                        "${data['text']}",
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
