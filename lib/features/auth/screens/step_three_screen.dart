import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/providers/stepper_provider.dart';
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
          description: "Let us know what your current dietary preference are.",
        ),
        Expanded(
          child: Consumer<StepperProvider>(
              builder: (context, stepperProvider, widget) {
            return ListView.builder(
              itemCount: stepperProvider.dietaries.length,
              itemBuilder: (context, index) {
                return DietaryCard(
                  dietary: stepperProvider.dietaries[index],
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
