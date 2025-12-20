import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

ThemeData themeEnglish = ThemeData(
  scaffoldBackgroundColor: AppColor.backgroundColor,
  fontFamily: 'Lato',
  primaryColor: AppColor.primaryColor,
  secondaryHeaderColor: AppColor.secondaryColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
    foregroundColor: AppColor.white,
    elevation: 6,
  ),
  appBarTheme: const AppBarTheme(
    color: AppColor.primaryColor,
    centerTitle: true,
    elevation: 4,
    shadowColor: Color(0x40DB6719), // Subtle orange shadow
    titleTextStyle: TextStyle(
      color: AppColor.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'Lato',
      letterSpacing: 0.5,
    ),
    iconTheme: IconThemeData(color: AppColor.white),
  ),
  tabBarTheme: const TabBarThemeData(
    labelColor: AppColor.primaryColor,
    unselectedLabelColor: AppColor.neutralMedium,
    indicatorColor: AppColor.primaryColor,
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'Lato',
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      fontFamily: 'Lato',
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary,
      letterSpacing: 0.3,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColor.textPrimary,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      height: 1.5,
      color: AppColor.textSecondary,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColor.textSecondary,
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColor.textTertiary,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColor.primaryColor,
    secondary: AppColor.accentColor,
    error: AppColor.errorColor,
    surface: AppColor.cardBackground,
    background: AppColor.backgroundColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      elevation: 3,
      shadowColor: AppColor.primaryColor.withOpacity(0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    ),
  ),
  cardTheme: CardThemeData(
    color: AppColor.cardBackground,
    elevation: 2,
    shadowColor: AppColor.neutralDark.withOpacity(0.1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColor.surfaceColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColor.neutralLight, width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColor.neutralLight, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.errorColor, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.errorColor, width: 2),
    ),
  ),
);

ThemeData themeArabic = ThemeData(
  fontFamily: 'Rubik',
  scaffoldBackgroundColor: AppColor.backgroundColor,
  primaryColor: AppColor.primaryColor,
  secondaryHeaderColor: AppColor.secondaryColor,
  appBarTheme: const AppBarTheme(
    color: AppColor.primaryColor,
    centerTitle: true,
    elevation: 4,
    shadowColor: Color(0x40DB6719), // Subtle orange shadow
    titleTextStyle: TextStyle(
      color: AppColor.white,
      fontSize: 26,
      fontWeight: FontWeight.w600,
      fontFamily: 'Rubik',
      letterSpacing: 0.3,
    ),
    iconTheme: IconThemeData(color: AppColor.white),
  ),
  tabBarTheme: const TabBarThemeData(
    labelColor: AppColor.primaryColor,
    unselectedLabelColor: AppColor.neutralMedium,
    indicatorColor: AppColor.primaryColor,
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Rubik',
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: 'Rubik',
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColor.textPrimary,
      letterSpacing: 0.2,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColor.textPrimary,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      height: 1.6,
      color: AppColor.textSecondary,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColor.textSecondary,
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColor.textTertiary,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColor.primaryColor,
    secondary: AppColor.accentColor,
    error: AppColor.errorColor,
    surface: AppColor.cardBackground,
    background: AppColor.backgroundColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      elevation: 3,
      shadowColor: AppColor.primaryColor.withOpacity(0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.3,
      ),
    ),
  ),
  cardTheme: CardThemeData(
    color: AppColor.cardBackground,
    elevation: 2,
    shadowColor: AppColor.neutralDark.withOpacity(0.1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColor.surfaceColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColor.neutralLight, width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColor.neutralLight, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.errorColor, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.errorColor, width: 2),
    ),
  ),
);
