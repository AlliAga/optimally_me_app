import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/providers/stepper_provider.dart';
import 'package:optimally_me_app/features/auth/screens/signup_screen.dart';
import 'package:optimally_me_app/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
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
      home: const SignupScreen(),
      theme: _themeProvider.getThemeData(),
      themeMode: _themeProvider.currentTheme,
    );
  }
}
