import 'package:boozin/features/core/theme/app_color.dart';
import 'package:boozin/features/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: kPrimaryColor,
    ),
    dialogBackgroundColor: kPrimaryColor,
    scaffoldBackgroundColor: kPrimaryColor,
    dialogTheme: DialogTheme(
      backgroundColor: kPrimaryColor,
      titleTextStyle: kTextStyleTitle.copyWith(
        color: kSecondaryColor,
      ),
      contentTextStyle: kTextStyleBody,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  ),
  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
    dialogBackgroundColor: kPrimaryColor,
    scaffoldBackgroundColor: kSecondaryColor,
    dialogTheme: DialogTheme(
      backgroundColor: kSecondaryColor,
      titleTextStyle: kTextStyleTitle.copyWith(
        color: kPrimaryColor,
      ),
      contentTextStyle: kTextStyleBody,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    primaryColor: Colors.black,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white), 
      bodyMedium: TextStyle(
          color: Colors.white), 
      displayLarge: TextStyle(
          color: Colors.white), 
      displayMedium: TextStyle(color: Colors.white),
      // Add more styles if needed to ensure consistency across your app
    ),
  ),
};
