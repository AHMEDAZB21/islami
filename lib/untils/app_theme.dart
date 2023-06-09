import 'package:flutter/material.dart';
import 'package:islami/untils/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(

    canvasColor: AppColors.primiaryColor,
    primaryColor: AppColors.primiaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: AppColors.accentColor),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
        color: AppColors.accentColor,
      ), // for sura name
      titleSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0), // for title in setting tap
      titleMedium: TextStyle(
          color: AppColors.primiaryColor,
          fontSize: 14), // for title in setting tap
      bodyLarge: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: AppColors.white,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: AppColors.accentColor,
      ), // اسم السورة قبل فتحها
      labelLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: AppColors.accentColor), // اسم السورة بعد فتحها
      titleLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
          color: AppColors.accentColor),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedIconTheme: IconThemeData(size: 30),
      showSelectedLabels: true,
      selectedItemColor: AppColors.accentColor,
      selectedIconTheme: IconThemeData(
        size: 36.0,
      ),
      selectedLabelStyle: TextStyle(
        color: AppColors.accentColor,
        fontSize: 12.0,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    canvasColor: AppColors.primiaryColorDark,
    primaryColor: AppColors.primiaryColorDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30.0, color: AppColors.white),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ), // for sura name
      titleSmall: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14.0), // لكلمة darkMode
      titleMedium: TextStyle(
        color: AppColors.primiaryColorDark,
        fontSize: 14,
      ), // for title in setting tap
      bodyLarge: TextStyle(
        color: AppColors.white,
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ), // اسم السورة قبل فتحها
      labelLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: AppColors.white),  // لاسم السورة بعد فتحها
      titleLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
          color: AppColors.accentColorDark),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedIconTheme: IconThemeData(size: 30),
      showSelectedLabels: true,
      selectedItemColor: AppColors.accentColorDark,
      selectedIconTheme: IconThemeData(
        size: 36.0,
      ),
      selectedLabelStyle: TextStyle(
        color: AppColors.accentColorDark,
        fontSize: 12.0,
      ),
    ),
  );
}
