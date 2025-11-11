import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/binding/initial_binding.dart';
import 'package:souq_al_khamis_admin_version/core/localization/change_local.dart';
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
    LocaleController localecontroller = Get.put(LocaleController()); //
    return GetMaterialApp(
      //translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // locale: localecontroller.language,
      theme: localecontroller.appTheme,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
