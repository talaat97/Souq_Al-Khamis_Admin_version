import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/binding/initial-binding.dart';
import 'package:souq_al_khamis_admin_version/core/localization/change_local.dart';
import 'package:souq_al_khamis_admin_version/core/localization/translation.dart';
import 'package:souq_al_khamis_admin_version/core/services/services.dart';
import 'package:souq_al_khamis_admin_version/firebase_options.dart';
import 'package:souq_al_khamis_admin_version/routs.dart';
import 'package:souq_al_khamis_admin_version/view/screens/home/home.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // طلب الإذن للإشعارات (مهم للويب)
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     badge: true,
//     sound: true,
//   );

//   print('User granted permission: ${settings.authorizationStatus}');

//   // تسجيل خدمة الرسائل الخلفية
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   await initialServices();
//   runApp(const MyApp());
// }

// // تعريف ال handler للرسائل الخلفية (يجب أن تكون دالة static أو top-level)
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   print('Handling a background message ${message.messageId}');
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     LocaleController localecontroller = Get.put(LocaleController()); //
//     return GetMaterialApp(
//       translations: MyTranslation(),
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       locale: localecontroller.language,
//       theme: localecontroller.appTheme,
//       initialBinding: InitialBindings(),
//       getPages: routes,
//     );
//   }
// }
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    
  );

  // تسجيل خدمة الرسائل الخلفية
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //LocaleController localecontroller = Get.put(LocaleController()); //
    return GetMaterialApp(
      //  translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
      //  locale: localecontroller.language,
      // theme: localecontroller.appTheme,
      //  initialBinding: InitialBindings(),
//getPages: routes,
    );
  }
}
