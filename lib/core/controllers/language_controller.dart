import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/services/services.dart';

class LanguageController extends GetxController {
  static const String _storageKey = 'lang';
  late MyServices _services;

  final currentLocale = const Locale('en', 'US').obs;

  @override
  void onInit() {
    super.onInit();
    _services = Get.find<MyServices>();
    final saved = _services.sharedPreferences.getString(_storageKey);
    if (saved != null) {
      currentLocale.value = _localeFromCode(saved);
    } else {
      final deviceLang = Get.deviceLocale?.languageCode ?? 'en';
      currentLocale.value = deviceLang == 'ar'
          ? const Locale('ar', 'AR')
          : const Locale('en', 'US');
    }
  }

  Locale get savedLocale => currentLocale.value;

  void changeLanguage(String langCode) {
    final locale = _localeFromCode(langCode);
    currentLocale.value = locale;
    _services.sharedPreferences.setString(_storageKey, langCode);
    Get.updateLocale(locale);
  }

  bool get isArabic => currentLocale.value.languageCode == 'ar';

  Locale _localeFromCode(String code) {
    if (code == 'ar') return const Locale('ar', 'AR');
    return const Locale('en', 'US');
  }
}
