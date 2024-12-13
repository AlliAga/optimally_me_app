import 'package:optimally_me_app/features/home/models/nav_option.dart';

abstract class HomeInterface {
  List<NavOption> get navptions;
  int get currentNavigationIndex;
  void onNavigationIndexChanged(int index);
}
