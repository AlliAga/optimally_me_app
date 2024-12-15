import 'package:flutter/material.dart';

enum ButtonType { filled, outlined }

class FormButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final ButtonType? type;

  const FormButton({
    super.key,
    this.onPressed,
    required this.text,
    this.type = ButtonType.filled,
  });

  @override
  Widget build(BuildContext context) {
    bool isOutlined = type == ButtonType.outlined;

    return ElevatedButton(
      style: isOutlined
          ? ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: const BorderSide(width: 0.5),
            )
          : null,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: isOutlined ? Colors.black : Colors.white),
      ),
    );
  }
}
