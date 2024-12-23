import 'package:flutter/material.dart';

class DifficultyTag extends StatefulWidget {
  final String difficulty;

  const DifficultyTag({super.key, required this.difficulty});

  @override
  State<DifficultyTag> createState() => _DifficultyTagState();
}

class _DifficultyTagState extends State<DifficultyTag> {
  String get difficulty => widget.difficulty.trim();

  Color get color {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return Colors.green;
      case 'medium':
        return Colors.amber.shade800;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: Text(
        difficulty,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
