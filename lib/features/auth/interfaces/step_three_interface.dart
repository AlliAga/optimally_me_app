import 'package:optimally_me_app/features/auth/models/dietary_model.dart';

abstract class StepThreeInterface {
  List<Dietary> get dietaries;
  void selectDeselectDietary(Dietary dietary);
}
