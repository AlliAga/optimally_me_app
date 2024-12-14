import 'package:flutter/material.dart';

class MultiSelectButtonOption {
  IconData icon;
  String value;
  String text;

  MultiSelectButtonOption({
    required this.icon,
    required this.value,
    required this.text,
  });
}

class MultiSelectButton extends StatefulWidget {
  final String defaultSelected;
  final void Function(String value)? onChange;
  final List<MultiSelectButtonOption> options;
  final EdgeInsetsGeometry? padding;

  const MultiSelectButton({
    super.key,
    required this.options,
    required this.defaultSelected,
    this.padding,
    this.onChange,
  });

  @override
  State<MultiSelectButton> createState() => _MultiSelectButtonState();
}

class _MultiSelectButtonState extends State<MultiSelectButton> {
  String selectedOption = "";

  @override
  void initState() {
    super.initState();
    selectedOption = widget.defaultSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: widget.options.map((option) {
          bool isSelected = selectedOption == option.value;
          Color backgroudColor = isSelected ? Colors.black : Colors.white;
          Color foregroundColor = !isSelected ? Colors.black : Colors.white;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onChange != null ? widget.onChange!(option.value) : null;
                selectedOption = option.value;
                setState(() {});
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: backgroudColor,
                  border: Border.all(
                    width: .5,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      option.icon,
                      color: foregroundColor,
                    ),
                    Text(option.text, style: TextStyle(color: foregroundColor)),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
