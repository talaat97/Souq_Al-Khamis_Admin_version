import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/core/function/upload_file.dart';

class AddCategoryController extends GetxController {
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController categoryNameArabicController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? file;

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

  void goToViewCategories() {
    Get.offAllNamed(AppRoute.categoriesPage);
  }

  void uploadFile() async {
    file = await fileUploadGallary();
    update();
  }
}
