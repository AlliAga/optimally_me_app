import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/home/widgets/circular_progress_widget.dart';
import 'package:optimally_me_app/widgets/button_widget.dart';
import 'package:optimally_me_app/widgets/progress_bar_widget.dart';

class LifestyleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String chip1Text, chip2Text;
  final int circularProgressPercentage;
  final String circularProgressDescription;
  final int linearProgressPercentage;

  const LifestyleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.chip1Text,
    required this.chip2Text,
    required this.circularProgressPercentage,
    required this.circularProgressDescription,
    required this.linearProgressPercentage,
  });

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
                icon,
                size: 27,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Chip(
                      label: Text(chip1Text),
                    ),
                    Chip(
                      label: Text(chip2Text),
                      backgroundColor: Theme.of(context).primaryColorDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CircularProgress(
                    percentage: 50, label: circularProgressDescription),
                const Spacer(),
              ],
            ),
          ),
          ProgressBar(percentage: linearProgressPercentage),
          const SizedBox(height: 10),
          Row(
            children: [1, 2, 3, 4, 5, 6, 7]
                .map((day) => Expanded(
                        child: Text(
                      "Day $day",
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.labelMedium?.fontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[150 * 2 * day],
                      ),
                    )))
                .toList(),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: FormButton(onPressed: () {}, text: "Go to workout")),
            ],
          ),
        ],
      ),
    );
  }
}
