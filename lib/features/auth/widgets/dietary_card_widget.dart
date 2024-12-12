import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/models/dietary_model.dart';

class DietaryCard extends StatelessWidget {
  final Dietary dietary;
  const DietaryCard({super.key, required this.dietary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 0.2,
        ),
      ),
      child: ListTile(
        leading: Icon(
          dietary.icon,
          size: 28,
          color: const Color(0xFF062021),
        ),
        title: Text(
          dietary.label,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF062021),
          ),
        ),
        trailing: Container(
          width: 25,
          height: 25,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: dietary.isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade500,
            ),
            shape: BoxShape.circle,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: dietary.isSelected ? Theme.of(context).primaryColor : null,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
