import 'package:optimally_me_app/features/home/models/feeling_model.dart';

abstract class FeelingInterface {
  List<Feeling> get feelings;
  void selectDeselectFeeling(Feeling feeling);
}
