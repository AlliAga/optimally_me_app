import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;

  const CircularIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade400,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(icon),
      ),
    );
  }
}
