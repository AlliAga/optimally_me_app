import 'package:optimally_me_app/features/auth/models/health_goal_model.dart';

abstract class StepTwoInteraface {
  List<HealthGoal> get healthGoals;
  bool get selectionCondition;
  void selectDeselectHealthGoals(HealthGoal healthGoal);
}
