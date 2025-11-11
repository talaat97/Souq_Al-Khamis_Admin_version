import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';

class AddCategoryController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController arTitleController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void goToViewCategories() {
    Get.toNamed(AppRoute.categoriesPage);
  }

  void addCategory() {
    if (formKey.currentState!.validate()) {
      // Add your logic to add the category here
      // For example, you might want to call an API or update a database
      Get.snackbar('Success', 'Category added successfully');
      goToViewCategories();
    } else {
      Get.snackbar('Error', 'Please fill in all fields correctly');
    }
  }
}
