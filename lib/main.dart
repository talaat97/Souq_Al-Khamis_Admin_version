import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/binding/initial_binding.dart';
import 'package:souq_al_khamis_admin_version/core/controllers/language_controller.dart';
import 'package:souq_al_khamis_admin_version/core/localization/change_local.dart';
import 'package:souq_al_khamis_admin_version/core/localization/localization_service.dart';
import 'package:souq_al_khamis_admin_version/core/services/services.dart';
import 'package:souq_al_khamis_admin_version/routs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController localecontroller = Get.put(LocaleController());
    final LanguageController langController = Get.put(LanguageController());

    return GetMaterialApp(
      translations: LocalizationService(),
      locale: langController.savedLocale,
      fallbackLocale: LocalizationService.fallback,
      debugShowCheckedModeBanner: false,
      title: 'Souq Admin',
      theme: localecontroller.appTheme,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
