import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/providers/stepper_provider.dart';
import 'package:optimally_me_app/features/auth/widgets/health_goal_card_widget.dart';
import 'package:optimally_me_app/features/auth/widgets/step_header_widget.dart';
import 'package:provider/provider.dart';

class StepTwoScreen extends StatelessWidget {
  const StepTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StepHeader(
          title: "What are your primary health goals?",
          description:
              "To personalise your diet to mmatch your unique goals. \nChoose up to 3.",
        ),
        Expanded(
          child: Consumer<StepperProvider>(
              builder: (context, stepperProvider, widget) {
            return ListView.builder(
              itemCount: stepperProvider.healthGoals.length,
              itemBuilder: (context, index) {
                return HealthGoalCard(
                  healthGoal: stepperProvider.healthGoals[index],
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
