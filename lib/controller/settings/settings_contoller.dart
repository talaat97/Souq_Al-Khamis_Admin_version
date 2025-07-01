import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/function/notification_helper.dart';
import '../../core/localization/change_local.dart';
import '../../core/services/services.dart';

class SettingsContoller extends GetxController {
  late String language;
  bool notifactionSwitch = false;
  MyServices myServices = Get.find();
  var languageController = Get.put(LocaleController());
  logOut() {
    myServices.sharedPreferences.setString('step', 'onboarding');
   // NotificationsHelper.firebaseMessaging.unsubscribeFromTopic('admin');
    Get.offAllNamed(AppRoute.login);
  }

  phoneCall() {
    launchUrl(Uri.parse('tel:+201113809492'));
  }

  diableNotification() {
    if (notifactionSwitch) {
     // NotificationsHelper.firebaseMessaging.unsubscribeFromTopic('admin');
    } else {
      //NotificationsHelper.firebaseMessaging.subscribeToTopic('admin');
    }
    print(
        '////////////////////////////////////////////////////////////////////');
    print(notifactionSwitch);
    print(
        '////////////////////////////////////////////////////////////////////');
    update();
  }

  changeLang() {
    Get.dialog(
      AlertDialog(
        title: const Text('Change language'),
        content: const Text('chooce between to language'),
        actions: [
          TextButton(
            child: const Text("Arapic"),
            onPressed: () {
              languageController.chnageLang('ar');
              Get.back();
            },
          ),
          TextButton(
            child: const Text("English"),
            onPressed: () {
              languageController.chnageLang('en');
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
