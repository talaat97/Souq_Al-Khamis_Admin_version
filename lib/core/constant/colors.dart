import 'package:flutter/material.dart';

class AppColor {
  // ═══════════════════════════════════════════════════════════════════════════
  // 🎨 Base Colors
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // Legacy gray colors (kept for backward compatibility)
  static const Color grey = Color(0xFF64748B); // Updated to slate-500
  static Color? grey200 = Colors.grey[200];
  static Color? grey600 = Colors.grey[600];

  // ═══════════════════════════════════════════════════════════════════════════
  // 🧡 Primary & Brand Colors
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color primaryColor = Color(0xFFDB6719); // Brand Orange ✨
  static const Color secondaryColor = Color(0xFF2C5F7D); // Deep Slate Blue
  static const Color accentColor = Color(0xFF4A9B9F); // Muted Teal
  static const Color tertiaryColor = Color(0xFFF9A654); // Soft Warm Orange

  // ═══════════════════════════════════════════════════════════════════════════
  // 🌫️ Neutral Palette (Slate-based)
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color neutralDark = Color(0xFF1E293B); // Slate-800 (rich dark)
  static const Color neutralMedium = Color(0xFF64748B); // Slate-500 (balanced)
  static const Color neutralLight =
      Color(0xFFE2E8F0); // Slate-200 (subtle light)
  static const Color neutralBG =
      Color(0xFFF8FAFC); // Slate-50 (clean background)

  // ═══════════════════════════════════════════════════════════════════════════
  // 🏠 Surface & Background Colors
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color backgroundColor = Color(0xFFFFF9F5); // Warm Cream
  static const Color surfaceColor = Color(0xFFFFF3E9); // Light Peach
  static const Color cardBackground = Color(0xFFFFFFFF); // Pure White for cards

  // ═══════════════════════════════════════════════════════════════════════════
  // 📝 Text Colors
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color textPrimary =
      Color(0xFF1E293B); // Slate-800 (rich readable)
  static const Color textSecondary = Color(0xFF475569); // Slate-600 (softer)
  static const Color textTertiary =
      Color(0xFF94A3B8); // Slate-400 (subtle hints)

  // ═══════════════════════════════════════════════════════════════════════════
  // ✅ Semantic Colors
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color successColor = Color(0xFF10B981); // Emerald-500
  static const Color warningColor = Color(0xFFF59E0B); // Amber-500
  static const Color errorColor = Color(0xFFEF4444); // Red-500
  static const Color infoColor = Color(0xFF3B82F6); // Blue-500

  // ═══════════════════════════════════════════════════════════════════════════
  // 🔄 Legacy Support Colors
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color blueColor = Color(0xFF3B82F6); // Updated to info blue
  static const Color accentOlive =
      Color(0xFF4A9B9F); // Replaced with teal accent
  static const Color redColor = Color(0xFFEF4444); // Updated to error red
  static const Color greenColor = Color(0xFF10B981); // Updated to success green
  static const Color green2Color =
      Color(0xFF059669); // Emerald-600 (darker green)
  static const Color yellowColor =
      Color(0xFFF59E0B); // Updated to warning amber
}

class OrderStatusColor {
  static const Color waiting = Color(0xFF8B5CF6); // Purple (pending)
  static const Color approve = Color(0xFF10B981); // Emerald (approved)
  static const Color preparing = Color(0xFFF59E0B); // Amber (in progress)
  static const Color shipping =
      Color(0xFFDB6719); // Brand Orange (active delivery)
  static const Color archived = Color(0xFF64748B); // Slate-500 (completed)
}
