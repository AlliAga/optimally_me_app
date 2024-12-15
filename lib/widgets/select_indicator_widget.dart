import 'package:flutter/material.dart';

class SelectIndicator extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final TabController? controller;
  final List<String> options;
  final void Function(int index)? onTap;

  const SelectIndicator({
    super.key,
    this.margin,
    this.controller,
    required this.options,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        dividerHeight: 0,
        onTap: onTap,
        padding: const EdgeInsets.all(2),
        labelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        isScrollable: false,
        labelPadding: const EdgeInsets.symmetric(vertical: 5),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
          shape: BoxShape.rectangle,
        ),
        controller: controller,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: options
            .map(
              (e) => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(e),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
