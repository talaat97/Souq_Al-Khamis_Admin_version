import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/curd.dart';
import 'package:souq_al_khamis_admin_version/features/order/controller/order_controller.dart';
import 'package:souq_al_khamis_admin_version/features/order/controller/order_detail_controller.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController(Get.find<Crud>()));
  }
}

class OrderDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailController(Get.find<Crud>()));
  }
}
