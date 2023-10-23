import 'package:flutter/material.dart';
import 'package:assa_doa/shared/theme/theme_config.dart';

ThemeData getDefaultTheme() {
  return ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: textColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: primaryColor,
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.grey,
      labelColor: primaryColor,
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 12,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 13,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 13,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 13,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 12,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 14,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 13,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 12,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 14,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 13,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: 12,
      ),
    ),
  );
}
