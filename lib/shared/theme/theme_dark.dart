import 'package:flutter/material.dart';
import 'package:assa_doa/shared/theme/theme_config.dart';

ThemeData getDarkTheme() {
  return ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0.6,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
    ),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.white,
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: whiteColor,
        fontSize: 12,
      ),
      titleMedium: TextStyle(
        color: whiteColor,
        fontSize: 13,
      ),
      titleLarge: TextStyle(
        color: whiteColor,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        color: whiteColor,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: textColor,
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
        color: whiteColor,
        fontSize: 13,
      ),
      labelLarge: TextStyle(
        color: whiteColor,
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        color: whiteColor,
        fontSize: 13,
      ),
      labelSmall: TextStyle(
        color: whiteColor,
        fontSize: 12,
      ),
      displayLarge: TextStyle(
        color: whiteColor,
        fontSize: 14,
      ),
      displayMedium: TextStyle(
        color: textColor,
        fontSize: 13,
      ),
      displaySmall: TextStyle(
        color: whiteColor,
        fontSize: 12,
      ),
      headlineLarge: TextStyle(
        color: whiteColor,
        fontSize: 14,
      ),
      headlineMedium: TextStyle(
        color: whiteColor,
        fontSize: 13,
      ),
      headlineSmall: TextStyle(
        color: whiteColor,
        fontSize: 12,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    ),
  );
}
