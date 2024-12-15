import 'package:optimally_me_app/features/nutrition/models/breakfast_model.dart';

abstract class MealPlanInterface {
  List<Breakfast> get breakfasts;
  void selectDeselectBreakFast(Breakfast breakfast);
}
