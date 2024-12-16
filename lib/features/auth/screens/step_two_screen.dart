import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/models/health_goal_model.dart';
import 'package:optimally_me_app/features/auth/providers/step_two_provider.dart';
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
              "To personalise your diet to match your unique goals. \nChoose up to 3.",
        ),
        Expanded(
          child:
              Consumer<StepTwoProvider>(builder: (context, provider, widget) {
            return ListView.builder(
              itemCount: provider.healthGoals.length,
              itemBuilder: (context, index) {
                final HealthGoal healthGoal = provider.healthGoals[index];

                return HealthGoalCard(
                  onTap: () => provider.selectDeselectHealthGoals(healthGoal),
                  healthGoal: healthGoal,
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
