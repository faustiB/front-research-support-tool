/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

import 'package:flutter/material.dart';
import 'package:research_support_tool/app/ui/theme/app_colors.dart';

class AppThemeData {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: AppColors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: AppColors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          color: AppColors.black,
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
          color: AppColors.black,
          fontSize: 14,
        ),
        bodyText2: TextStyle(
          color: AppColors.black,
          fontSize: 12,
        ),
      ),
    );
  }
}