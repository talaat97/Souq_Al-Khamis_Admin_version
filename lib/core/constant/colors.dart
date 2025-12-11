import 'package:flutter/material.dart';

class AppColor {
  static const Color black = Color(0xEE000000);
  static const Color white = Color(0xFFFFFCFC);
  static const Color grey = Color(0xFF2E2E2E);
  static Color? grey200 = Colors.grey[200];
  static Color? grey600 = Colors.grey[600];
  static const Color blueColor = Color(0xFF247BA0); // Calm trust blue
  ///////////////
  static const Color primaryColor = Color(0xFFDB6719); // Orange
  static const Color secondaryColor = Color(0xFF8B401D); // Dark orange/brown
  static const Color tertiaryColor = Color(0xFFF4A261); // Soft warm orange
  static const Color neutralDark = Color(0xFF2D2A26); // Replaces grey
  static const Color neutralMedium = Color(0xFF7A716A);
  static const Color neutralLight = Color(0xFFEDE7E3);
  static const Color neutralBG = Color(0xFFFAF7F4); // Cleaner than #FFF8F4
  static const Color backgroundColor = Color(0xFFFFF8F4);
  static const Color surfaceColor = Color(0xFFFFEFE3);
  static const Color textPrimary = Color(0xFF2C1810);
  static const Color textSecondary = Color(0xFF5C3B2A);
  static const Color successColor = Color(0xFF4CAF50); // Softer green
  static const Color warningColor = Color(0xFFFFC107); // Warm yellow
  static const Color errorColor = Color(0xFFD32F2F); // Clean red
  static const Color accentOlive = Color(0xFF6B7E48); // Used in admin apps
  ///////////////
  static const Color redColor = Color(0xFFB32218);
  static const Color greenColor = Color.fromARGB(255, 20, 121, 16);
  static const Color green2Color = Color.fromARGB(255, 18, 146, 14);
  static const Color yellowColor = Color.fromARGB(150, 255, 196, 3);
}

class OrderStatusColor {
  static const Color waiting = Color(0xFF6B7E48); // Olive instead of blue
  static const Color approve = Color(0xFF4CAF50); // Standard success green
  static const Color preparing = Color(0xFFF4A261); // Soft warm orange
  static const Color shipping = Color(0xFFDB6719); // Brand primary
  static final Color archived = Color(0xFF7A716A); // Medium neutral grey
}
