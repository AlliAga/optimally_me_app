import 'package:flutter/material.dart';

class CircularCheckbox extends StatelessWidget {
  final bool isSelected;
  final void Function()? onTap;

  const CircularCheckbox({super.key, required this.isSelected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 25,
        height: 25,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade500,
          ),
          shape: BoxShape.circle,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).primaryColor : null,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
