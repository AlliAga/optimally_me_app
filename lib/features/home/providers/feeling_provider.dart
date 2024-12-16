import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/home/interfaces/feeling_interface.dart';
import 'package:optimally_me_app/features/home/models/feeling_model.dart';

class FeelingProvider extends ChangeNotifier implements FeelingInterface {
  final List<Feeling> _feelings = [
    Feeling(emoji: "😣", label: "Awful"),
    Feeling(emoji: "😑", label: "Not great"),
    Feeling(emoji: "😌", label: "Ok", isSelected: true),
    Feeling(emoji: "😊", label: "Good"),
    Feeling(emoji: "😄", label: "Great"),
  ];

  @override
  List<Feeling> get feelings => _feelings;

  @override
  void selectDeselectFeeling(Feeling feeling) {
    for (int i = 0; i < _feelings.length; i++) {
      _feelings[i].isSelected = false;
    }

    feeling.isSelected = !(feeling.isSelected ?? false);
    notifyListeners();
  }
}
