import 'package:all_app_tutorial/food_app_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MyFoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food UI Kit',
      theme: createCustomThemeData(),
      // theme: buildThemeData(),
      home: const HomeScreen(),
    );
  }

  ThemeData createCustomThemeData() {
    return ThemeData(
      textTheme: const TextTheme(
          caption: TextStyle(
            fontSize: 14,
          ),
          headline5: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.3)),
    );
  }
}
