import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/providers/step_one_provider.dart';
import 'package:optimally_me_app/features/auth/providers/step_three_provider.dart';
import 'package:optimally_me_app/features/auth/providers/step_two_provider.dart';
import 'package:optimally_me_app/features/auth/providers/stepper_provider.dart';
import 'package:optimally_me_app/features/auth/screens/signup_screen.dart';
import 'package:optimally_me_app/features/home/providers/device_data_provider.dart';
import 'package:optimally_me_app/features/home/providers/feeling_provider.dart';
import 'package:optimally_me_app/features/home/providers/home_provider.dart';
import 'package:optimally_me_app/features/nutrition/providers/meal_plan_provider.dart';
import 'package:optimally_me_app/features/nutrition/providers/recipe_provider.dart';
import 'package:optimally_me_app/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DeviceDataProvider()),
      ChangeNotifierProvider(create: (_) => FeelingProvider()),
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => MealPlanProvider()),
      ChangeNotifierProvider(create: (_) => RecipeProvider()),
      ChangeNotifierProvider(create: (_) => StepOneProvider()),
      ChangeNotifierProvider(create: (_) => StepTwoProvider()),
      ChangeNotifierProvider(create: (_) => StepThreeProvider()),
      ChangeNotifierProvider(create: (_) => StepperProvider()),
    ],
    child: const OptimallyMe(),
  ));
}

class OptimallyMe extends StatefulWidget {
  const OptimallyMe({super.key});

  @override
  State<OptimallyMe> createState() => _OptimallyMeState();
}

class _OptimallyMeState extends State<OptimallyMe> {
  final ThemeProvider _themeProvider = ThemeProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignupScreen(),
      theme: _themeProvider.getThemeData(),
      themeMode: _themeProvider.currentTheme,
    );
  }
}
