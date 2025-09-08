import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/core/function/store_mapData_sPref.dart';
import 'package:souq_al_khamis_admin_version/core/services/services.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/remote/Auth/login_data.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';

abstract class LogeinCotroller extends GetxController {
  login();
}

class LogeinControllerImp extends LogeinCotroller {
  MyServices myServices = Get.find();
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isShowPassword = false;
  LoginData loginData = LoginData(Get.find());
  StatusRequest? statusRequest;

  @override
  login() async {
    if (formkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
        email.text,
        password.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // myServices.sharedPreferences
          //     .setString('deliveryId', response['data']['delivery_id']);
          // myServices.sharedPreferences
          //     .setString('deliveryName', response['data']['delivery_name']);
          // myServices.sharedPreferences
          //     .setString('deliveryEmail', response['data']['delivery_email']);
          // myServices.sharedPreferences
          //     .setString('deliveryPhone', response['data']['delivery_phone']);
          // myServices.sharedPreferences.setString('step', 'Auth');
          // save data to shared preferences
          final prefsMap = {
            'deliveryId': response['data']['delivery_id'],
            'deliveryName': response['data']['delivery_name'],
            'deliveryEmail': response['data']['delivery_email'],
            'deliveryPhone': response['data']['delivery_phone'],
            'step': 'Auth',
          };
          saveToPrefs(prefsMap);
          // NotificationsHelper.firebaseMessaging.subscribeToTopic('admin');
          Get.offNamed(AppRoute.home);
        }
        if (response['status'] == "failure") {
          Get.defaultDialog(
              title: 'OPPPS!',
              middleText: "looks like you dont have account yet!");
          statusRequest = StatusRequest.failure;
        }
      } else {
        StatusRequest.failure;
      }

      update();
    }
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
