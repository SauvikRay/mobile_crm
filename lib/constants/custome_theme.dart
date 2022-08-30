import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_crm/constants/appcolors.dart';

class CustomTheme {
  BuildContext? context;

  // CustomTheme._();
  static ThemeData get mainTheme {
    return ThemeData(
      primarySwatch: AppColors.kToDark,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: AppColors.scaffoldColor,
      primaryColor: AppColors.primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 3,
        // titleTextStyle: TextFontStyle.welcome,
        iconTheme: IconThemeData(
          size: 25.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}
