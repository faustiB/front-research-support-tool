import 'package:flutter/material.dart';
import 'package:research_support_tool/app/ui/theme/app_colors.dart';

class AppThemeData {
  static ThemeData get lightTheme {
    //TODO: Modify to our own app theme
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        headline5: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 14,
        ),
        bodyText2: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 12,
        ),
      ),
    );
  }
}