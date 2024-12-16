class Feeling {
  String emoji;
  String label;
  bool? isSelected;

  Feeling({
    required this.emoji,
    required this.label,
    this.isSelected = false,
  });
}
