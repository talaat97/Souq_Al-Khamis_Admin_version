import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/services/services.dart';

MyServices myServices = Get.find();
void saveToPrefs(Map<String, dynamic> map) {
  map.forEach((key, value) {
    myServices.sharedPreferences.setString(key, value.toString());
  });
}
