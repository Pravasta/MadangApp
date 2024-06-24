import 'package:flutter/material.dart';
import 'package:madang/constant/app_colors.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.secondary70,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.secondary70,
      surfaceTintColor: AppColors.secondary70,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.secondary90,
      selectedItemColor: AppColors.white,
    ),
  );
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primaryMain,
    ),
  );
}
