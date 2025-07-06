import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';

import '../services/services.dart';

class Mymiddleware extends GetMiddleware {
  MyServices myServices = Get.find();
  //int? get Priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "Auth") {
      log('--------------------فهمك عمتا !! --------------------------');
      return const RouteSettings(name: AppRoute.home);
    }

    if (myServices.sharedPreferences.getString("step") == "onboarding") {
      return const RouteSettings(name: AppRoute.login);
    }

    return null;
  }
}
