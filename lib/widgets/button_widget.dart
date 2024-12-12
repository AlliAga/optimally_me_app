import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const FormButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
