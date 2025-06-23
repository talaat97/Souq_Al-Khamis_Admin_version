import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/services/services.dart';

String tr(columnEn, columnAr) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString('lang') == 'ar') {
    return columnAr;
  } else {
    return columnEn;
  }
}
