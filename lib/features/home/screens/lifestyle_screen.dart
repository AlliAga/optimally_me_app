import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/home/widgets/calory_card_widget.dart';
import 'package:optimally_me_app/features/home/widgets/lifestyle_card_widget.dart';
import 'package:optimally_me_app/features/home/widgets/water_intake_card_widget.dart';

class LifestyleScreen extends StatelessWidget {
  const LifestyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CaloryCard(),
        WaterIntakeCard(),
        LifestyleCard(
          icon: Icons.accessibility,
          title: "Fitness program",
          description: "Heartbeat accelarator: \n cardio power program",
          chip1Text: "Cardio",
          chip2Text: "Beginner",
          circularProgressPercentage: 50,
          circularProgressDescription: "4 days left",
          linearProgressPercentage: 30,
        ),
        LifestyleCard(
          icon: Icons.health_and_safety,
          title: "Wellness journey",
          description: "Mindfull stress \nreduction program",
          chip1Text: "Stress",
          chip2Text: "Wellness",
          circularProgressPercentage: 50,
          circularProgressDescription: "3 steps left",
          linearProgressPercentage: 30,
        ),
      ],
    );
  }
}
