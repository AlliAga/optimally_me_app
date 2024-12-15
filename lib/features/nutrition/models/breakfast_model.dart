class Breakfast {
  int id;
  String image;
  String name;
  List<String> tags;
  int servings;
  int kcal;
  bool? isSelected;

  Breakfast({
    required this.id,
    required this.image,
    required this.name,
    required this.tags,
    required this.servings,
    required this.kcal,
    this.isSelected = false,
  });
}
