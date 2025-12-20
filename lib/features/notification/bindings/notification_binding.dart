import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/curd.dart';
import 'package:souq_al_khamis_admin_version/features/notification/controllers/notification_controller.dart';
import 'package:souq_al_khamis_admin_version/features/notification/data/datasource/notification_remote_ds.dart';
import 'package:souq_al_khamis_admin_version/features/notification/data/repositories/notification_repository.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut(() => NotificationRemoteDataSource(Get.find()));
    Get.lazyPut(() => NotificationRepository(Get.find()));
    Get.lazyPut(() => NotificationController(Get.find()));
  }
}
