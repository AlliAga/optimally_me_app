import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/providers/meal_plan_provider.dart';
import 'package:optimally_me_app/features/nutrition/widgets/breakfast_card_widget.dart';
import 'package:optimally_me_app/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class MealPlanScreen extends StatelessWidget {
  const MealPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15.0),
      children: [
        Row(
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Week view",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Row(
              children: [
                Icon(Icons.keyboard_arrow_left),
                Text(
                  "May 20 - 26",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      "Add to shopping list",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                )),
          ],
        ),
        Row(
          children: [
            Text(
              "21 May 2024",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Today",
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            )
          ],
        ),
        Row(
          children: [
            {"value": "1933", "unit": "kcal"},
            {"value": "60g", "unit": "c"},
            {"value": "40g", "unit": "p"},
          ]
              .map(
                (data) => Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Text(
                        data['value'] ?? "",
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        data['unit'] ?? "",
                        style: TextStyle(
                            fontSize: 15, color: Colors.blueGrey.shade300),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(
                "Breakfast",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              )
            ],
          ),
        ),
        Consumer<MealPlanProvider>(builder: (context, provider, widget) {
          return Column(
            children: [
              ...provider.breakfasts.map((breakfast) {
                return BreakfastCard(
                  breakfast: breakfast,
                );
              }),
              Row(
                children: [
                  Expanded(
                    child: FormButton(
                      onPressed: () {},
                      icon: Icons.add,
                      type: ButtonType.outlined,
                      text: "Add breakfast",
                    ),
                  ),
                ],
              ),
            ],
          );
        })
      ],
    );
  }
}
