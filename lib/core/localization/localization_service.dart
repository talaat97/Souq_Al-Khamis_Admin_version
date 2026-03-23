import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/localization/languages/ar_AR.dart';
import 'package:souq_al_khamis_admin_version/core/localization/languages/en_US.dart';

class LocalizationService extends Translations {
  static const Locale en = Locale('en', 'US');
  static const Locale ar = Locale('ar', 'AR');

  static const Locale fallback = en;

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ar_AR': arAR,
      };
}
