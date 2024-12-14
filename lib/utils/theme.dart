import 'package:flutter/material.dart';
import 'package:optimally_me_app/constants/style.dart';

class ThemeProvider extends ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  final Color primaryColor = const Color(0xFF3ECAE3);

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    // PreferenceHelper.getInstance().setDarkMode(_isDarkTheme);
    notifyListeners();
  }

  ThemeData getThemeData() {
    final AppStyle appStyle = AppStyle.getInstance();
    MaterialColor primarySwatch = MaterialColor(
      primaryColor.value,
      {
        50: primaryColor.withOpacity(0.1),
        100: primaryColor.withOpacity(0.2),
        200: primaryColor.withOpacity(0.3),
        300: primaryColor.withOpacity(0.4),
        400: primaryColor.withOpacity(0.5),
        500: primaryColor.withOpacity(0.6),
        600: primaryColor.withOpacity(0.7),
        700: primaryColor.withOpacity(0.8),
        800: primaryColor.withOpacity(0.9),
        900: primaryColor.withOpacity(1.0),
      },
    );

    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      primaryColorDark: appStyle.primaryColorDark,
      scaffoldBackgroundColor: appStyle.scaffoldBackgroundColor,
      brightness: _isDarkTheme ? Brightness.dark : Brightness.light,
      primarySwatch: primarySwatch,
      dividerColor: _isDarkTheme ? Colors.black54 : Colors.white54,
      fontFamily: 'NeueMontreal',
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        shape: Border(
            bottom: BorderSide(
          width: 1.2,
          color: Colors.grey.shade300,
        )),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.grey,
          ),
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.black),
            ),
          )),
      chipTheme: ChipThemeData(
        backgroundColor: primarySwatch,
        elevation: 0,
        labelStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: primarySwatch),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: primaryColor,
          textStyle: const TextStyle(fontSize: 15, letterSpacing: 1),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primarySwatch,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: _isDarkTheme ? Colors.white : Colors.black,
        ),
        displayMedium: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: _isDarkTheme ? Colors.white : Colors.black,
        ),
        displaySmall: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: _isDarkTheme ? Colors.white : Colors.black,
        ),
        headlineMedium: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: _isDarkTheme ? Colors.white : Colors.black,
        ),
        headlineSmall: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: _isDarkTheme ? Colors.white : Colors.black,
        ),
        titleLarge: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: _isDarkTheme ? Colors.white : Colors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: _isDarkTheme ? Colors.white : Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: _isDarkTheme ? Colors.white : Colors.black,
        ),
      ),
      dialogBackgroundColor: Colors.white,
    );
  }
}
