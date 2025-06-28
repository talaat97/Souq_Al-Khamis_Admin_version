import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';

class CategoriesController extends GetxController {
  bool modeEdit = false;

  void toEditMode() {
    modeEdit = !modeEdit;
    update();
  }

  void goToAddCategory() {
    Get.toNamed(AppRoute.addCategory);
  }
}
