import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/curd.dart';
import 'package:souq_al_khamis_admin_version/features/items/controllers/add.dart';
import 'package:souq_al_khamis_admin_version/features/items/controllers/edit.dart';
import 'package:souq_al_khamis_admin_version/features/items/controllers/view.dart';
import 'package:souq_al_khamis_admin_version/features/items/data/datasource/items_remote_ds.dart';
import 'package:souq_al_khamis_admin_version/features/items/data/repositories/items_repository.dart';

class ItemsBinding implements Bindings {
  @override
  void dependencies() {
    //view
    Get.lazyPut(() => ItemsRemoteDataSource(Get.find<Crud>()));
    Get.lazyPut(() => ItemsRepository(Get.find()));
    Get.lazyPut(() => ItemsController(Get.find()));
    //add
    Get.put(AddItemsController(Get.find()));
    //edit
    Get.lazyPut(() => EditItemsController(Get.find()));
  }
}
