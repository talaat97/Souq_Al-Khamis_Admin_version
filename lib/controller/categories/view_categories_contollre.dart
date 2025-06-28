import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';

class CategoriesController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController arTitleController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool modeEdit = false;
  bool modeDelete = false;
  bool bottomSheetVisible = false;

  void switchEditMode() {
    modeEdit = !modeEdit;
    update();
  }

  void goToAddCategory() {
    Get.toNamed(AppRoute.addCategory);
  }

  void switchDeleteMode() {
    modeDelete = !modeDelete;
    update();
  }

  void editCategory() {
    modeEdit = false;
    bottomSheetVisible = false;
    update();
    Get.back();
  }

  void deleteCategory() {
    // Perform delete operation
    Get.back();
    update();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    arTitleController.dispose();
    imageController.dispose();
    super.onClose();
  }
}
