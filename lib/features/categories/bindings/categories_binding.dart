import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/curd.dart';
import 'package:souq_al_khamis_admin_version/features/categories/controllers/add.dart';
import 'package:souq_al_khamis_admin_version/features/categories/controllers/view.dart';
import 'package:souq_al_khamis_admin_version/features/categories/data/datasource/categories_remote_ds.dart';
import 'package:souq_al_khamis_admin_version/features/categories/data/repositories/categories_repository.dart';

class CategoriesBinding implements Bindings {
  @override
  void dependencies() {
    //view
    Get.lazyPut(() => CategoriesRemoteDataSource(Get.find<Crud>()));
    Get.lazyPut(() => CategoriesRepository(Get.find()));
    Get.lazyPut(() => CategoriesController(Get.find()));
    //add
    Get.put(AddCategoryController(Get.find()));
  }
}
