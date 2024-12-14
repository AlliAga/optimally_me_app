import 'package:flutter/material.dart';
import 'package:optimally_me_app/widgets/circular_icon_button_widget.dart';

class WaterIntakeCard extends StatelessWidget {
  const WaterIntakeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1.2),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.water_drop,
                size: 27,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 10),
              Text(
                "Water Intake",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "0.5",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text("/2.25L"),
              ),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircularIconButton(icon: Icons.remove),
                  SizedBox(width: 10),
                  Text(
                    "0.25 L",
                    textScaler: TextScaler.linear(1.2),
                  ),
                  SizedBox(width: 10),
                  CircularIconButton(icon: Icons.add),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
