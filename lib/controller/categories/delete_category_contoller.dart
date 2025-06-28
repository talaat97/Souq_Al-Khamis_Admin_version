import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';

class DeleteCategoryController extends GetxController {
  TextEditingController titleController = TextEditingController();



  void goToViewCategories() {
    Get.toNamed(AppRoute.categoriesPage);
  }

  void deleteCategory(String categoryId) {

    // Add your logic to delete the category here
    // For example, you might want to call an API or update a database
    Get.snackbar('Success', 'Category deleted successfully');
    goToViewCategories();
  }
}
