import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: 'Lato',
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
  ),
  appBarTheme: const AppBarTheme(
    color: AppColor.white,
    titleTextStyle: TextStyle(
        color: AppColor.primaryColor, fontSize: 35, fontFamily: 'Lato'),
    centerTitle: true,
    elevation: 5,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
    headlineLarge: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
    bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        height: 2,
        color: AppColor.grey),
    labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColor.primaryColor),
  ),
);

ThemeData themeArabic = ThemeData(
  fontFamily: 'Rubik',
  appBarTheme: AppBarTheme(
    color: AppColor.primaryColor,
    backgroundColor: AppColor.primaryColor,
    titleTextStyle:
        TextStyle(color: AppColor.white, fontSize: 35, fontFamily: 'Rubik'),
    centerTitle: true,
    elevation: 5,
  ),
  textTheme: const TextTheme(
    labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColor.primaryColor),
    titleLarge: TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
    headlineLarge: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
    bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        height: 2,
        color: AppColor.grey),
  ),
);
