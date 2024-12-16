import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/models/dietary_model.dart';
import 'package:optimally_me_app/features/auth/providers/step_three_provider.dart';
import 'package:optimally_me_app/features/auth/widgets/dietary_card_widget.dart';
import 'package:optimally_me_app/features/auth/widgets/step_header_widget.dart';
import 'package:provider/provider.dart';

class StepThreeScreen extends StatelessWidget {
  const StepThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StepHeader(
          title: "Tell us about what you eat?",
          description: "Let us know what your current dietary preferences are.",
        ),
        Expanded(
          child:
              Consumer<StepThreeProvider>(builder: (context, provider, widget) {
            return ListView.builder(
              itemCount: provider.dietaries.length,
              itemBuilder: (context, index) {
                final Dietary dietary = provider.dietaries[index];

                return DietaryCard(
                  onTap: () => provider.selectDeselectDietary(dietary),
                  dietary: dietary,
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
