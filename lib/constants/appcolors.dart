import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color scaffoldColor = Color(0xFFD9D9D9);
  static const Color primaryColor = Color(0xFF1AA3E8);
  static const Color secondaryColor = Color(0xFF727272);
  static const Color greenColor = Color(0xFF68B08F);
  static const Color textFieldBorderColor = Color(0xFFE5E5E5);
  static const Color errorColor = Color.fromARGB(255, 240, 108, 76);
  static const Color linkColor = Color(0xFF989BA5);
  static const Color shadowText = Color(0xFFF6F8FA);
  static const Color shadowText2 = Color(0xFFC4C4C4);

  static const MaterialColor kToDark = MaterialColor(
    0xFF1AA3E8, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFF1AA3E8), //10%
      100: Color(0xFF1AA3E8), //20%
      200: Color(0xFF1AA3E8), //30%
      300: Color(0xFF1AA3E8), //40%
      400: Color(0xFF1AA3E8), //50%
      500: Color(0xFF1AA3E8), //60%
      600: Color(0xFF1AA3E8), //70%
      700: Color(0xFF1AA3E8), //80%
      800: Color(0xFF1AA3E8), //80%
      900: Color(0xFF1AA3E8), //80%
    },
  );
}
