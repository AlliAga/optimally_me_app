import 'package:flutter/material.dart';

class NavigaionOption extends StatelessWidget {
  final Function()? onTap;
  final bool isSelected;
  final IconData icon;
  final String text;

  const NavigaionOption({
    super.key,
    this.onTap,
    this.isSelected = false,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.grey,
            ),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
