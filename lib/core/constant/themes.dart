import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

ThemeData themeEnglish = ThemeData(
  scaffoldBackgroundColor: AppColor.backgroundColor, // #FFF8F4
  fontFamily: 'Lato',
  primaryColor: AppColor.primaryColor, // #DB6719
  secondaryHeaderColor: AppColor.secondaryColor, // #8B401D
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor, // #DB6719
    foregroundColor: AppColor.white, // Contrast for FAB icon
  ),
  appBarTheme: const AppBarTheme(
    color: AppColor.primaryColor, // Use primary color for AppBar
    titleTextStyle:
        TextStyle(color: AppColor.white, fontSize: 25, fontFamily: 'Lato'),
    centerTitle: true,
    elevation: 5,
    iconTheme: IconThemeData(color: AppColor.white),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.textPrimary),
    headlineLarge: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.textPrimary),
    bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        height: 2,
        color: AppColor.textSecondary),
    labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColor.tertiaryColor), // Accent color
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColor.primaryColor,
    secondary: AppColor.tertiaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryColor, // Main button color
      foregroundColor: AppColor.white, // Text/Icon color
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

ThemeData themeArabic = ThemeData(
  fontFamily: 'Rubik',
  scaffoldBackgroundColor: AppColor.backgroundColor, // Match English theme
  primaryColor: AppColor.primaryColor,
  secondaryHeaderColor: AppColor.secondaryColor,
  appBarTheme: const AppBarTheme(
    color: AppColor.primaryColor,
    titleTextStyle:
        TextStyle(color: AppColor.white, fontSize: 35, fontFamily: 'Rubik'),
    centerTitle: true,
    elevation: 5,
    iconTheme: IconThemeData(color: AppColor.white),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.textPrimary),
    headlineLarge: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.textPrimary),
    bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        height: 2,
        color: AppColor.textSecondary),
    labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColor.tertiaryColor),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColor.primaryColor,
    secondary: AppColor.tertiaryColor,
  ),
);
