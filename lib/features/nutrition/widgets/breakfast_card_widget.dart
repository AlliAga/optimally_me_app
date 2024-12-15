import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/models/breakfast_model.dart';
import 'package:optimally_me_app/features/nutrition/providers/meal_plan_provider.dart';
import 'package:optimally_me_app/features/nutrition/widgets/tag_chip_widget.dart';
import 'package:provider/provider.dart';

class BreakfastCard extends StatelessWidget {
  final Breakfast breakfast;

  const BreakfastCard({super.key, required this.breakfast});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              breakfast.image,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      breakfast.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )),
                    TagChip(text: breakfast.tags[0]),
                    Consumer<MealPlanProvider>(
                      builder: (context, provider, widget) {
                        return Checkbox(
                          activeColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          side: const BorderSide(width: 0.5),
                          value: breakfast.isSelected,
                          onChanged: (isSelected) =>
                              provider.selectDeselectBreakFast(breakfast),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    {
                      "icon": Icons.person_outline,
                      "text": "${breakfast.servings} servings"
                    },
                    {
                      "icon": Icons.calculate_outlined,
                      "text": "${breakfast.kcal} kcal"
                    },
                  ]
                      .map((data) => Container(
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
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
