import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/curd.dart';
import 'package:souq_al_khamis_admin_version/features/delivery/controller/delivery_controller.dart';

class DeliveryBinding implements Bindings {
  @override
  void dependencies() {
    // Inject the controller lazily
    Get.lazyPut(() => DeliveryController(Get.find<Crud>()));
  }
}
