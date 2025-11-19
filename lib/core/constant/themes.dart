import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

ThemeData themeEnglish = ThemeData(
  scaffoldBackgroundColor: AppColor.neutralBG,
  fontFamily: 'Lato',
  primaryColor: AppColor.primaryColor,
  secondaryHeaderColor: AppColor.secondaryColor,

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
    foregroundColor: AppColor.white,
  ),

  appBarTheme: const AppBarTheme(
    color: AppColor.primaryColor,
    centerTitle: true,
    elevation: 5,
    titleTextStyle: TextStyle(
      color: AppColor.white,
      fontSize: 25,
      fontFamily: 'Lato',
    ),
    iconTheme: IconThemeData(color: AppColor.white),
  ),

  // ⭐ Updated TabBarTheme with new palette
  tabBarTheme: const TabBarThemeData(
    labelColor: AppColor.primaryColor,          // Selected
    unselectedLabelColor: AppColor.neutralMedium,
    indicatorColor: AppColor.primaryColor,      // Underline
    labelStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  ),

  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColor.textPrimary),
    headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.textPrimary),
    bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        height: 1.6,
        color: AppColor.textSecondary),
    labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColor.accentOlive),
  ),

  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColor.primaryColor,
    secondary: AppColor.accentOlive,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
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
  scaffoldBackgroundColor: AppColor.neutralBG,
  primaryColor: AppColor.primaryColor,
  secondaryHeaderColor: AppColor.secondaryColor,

  appBarTheme: const AppBarTheme(
    color: AppColor.primaryColor,
    centerTitle: true,
    elevation: 5,
    titleTextStyle: TextStyle(
      color: AppColor.white,
      fontSize: 30,
      fontFamily: 'Rubik',
    ),
    iconTheme: IconThemeData(color: AppColor.white),
  ),

  tabBarTheme: const TabBarThemeData(
    labelColor: AppColor.primaryColor,
    unselectedLabelColor: AppColor.neutralMedium,
    indicatorColor: AppColor.primaryColor,
    labelStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Rubik',
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      fontFamily: 'Rubik',
    ),
  ),

  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColor.textPrimary),
    headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.textPrimary),
    bodyLarge: TextStyle(
        fontSize: 20,
        height: 1.6,
        color: AppColor.textSecondary),
    labelMedium: TextStyle(
        fontSize: 14,
        color: AppColor.accentOlive),
  ),

  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColor.primaryColor,
    secondary: AppColor.accentOlive,
  ),
);
