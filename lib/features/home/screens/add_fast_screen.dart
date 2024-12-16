import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/home/models/feeling_model.dart';
import 'package:optimally_me_app/features/home/providers/feeling_provider.dart';
import 'package:optimally_me_app/features/home/widgets/circular_progress_widget.dart';
import 'package:optimally_me_app/features/home/widgets/feeling_box_card_widget.dart';
import 'package:optimally_me_app/widgets/button_widget.dart';
import 'package:optimally_me_app/widgets/input_form_field_widget.dart';
import 'package:provider/provider.dart';

class AddFastScreen extends StatelessWidget {
  const AddFastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      children: [
        const SizedBox(
          height: 200,
          child: Row(
            children: [
              Spacer(),
              CircularProgress(
                percentage: 100,
                label: "Toatl fast",
                secondaryPercentageText: "12h 0m",
              ),
              Spacer(),
            ],
          ),
        ),
        Text(
          "Summary",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 15),
        Column(
          children: [
            Row(
              children: [
                Text(
                  "Summary",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                Text(
                  "12: 12",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                )
              ],
            ),
            const SizedBox(height: 10),
            ...[
              {"text": "Started", "value": "6 May 2024 at 18:00"},
              {"text": "Finished", "value": "7 May 2024 at 06:00"},
            ].map((data) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      data["text"] ?? "",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    Container(
                      width: 180,
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        data['value'] ?? "",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
        const SizedBox(height: 25),
        Text(
          "How are you feeling?",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 125,
          child:
              Consumer<FeelingProvider>(builder: (context, provider, widget) {
            List<Feeling> feelings = provider.feelings;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: feelings.length,
              itemBuilder: (context, index) {
                final Feeling feeling = feelings[index];
                return FeelingBoxCard(
                  onTap: () => provider.selectDeselectFeeling(feeling),
                  feeling: feeling,
                );
              },
            );
          }),
        ),
        const InputFormField(
          padding: EdgeInsets.symmetric(vertical: 10),
          label: "Add a note (optional)",
          hintText: "Enter a note",
        ),
        FormButton(
          text: "Add fast",
          onPressed: () {},
        )
      ],
    );
  }
}
