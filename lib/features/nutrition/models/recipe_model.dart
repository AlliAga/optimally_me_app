class Recipe {
  int id;
  String image;
  String name;
  List<String> tags;
  int minutes;
  int servings;
  bool? isBookmarked;

  Recipe({
    required this.id,
    required this.image,
    required this.name,
    required this.tags,
    required this.minutes,
    required this.servings,
    this.isBookmarked = false,
  });
}
