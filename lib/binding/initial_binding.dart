import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/curd.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Crud ============================
    Get.put(Crud());
    // notification ============================
  }
}
