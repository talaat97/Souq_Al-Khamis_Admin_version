import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/core/function/upload_file.dart';
import 'package:souq_al_khamis_admin_version/features/categories/data/repositories/categories_repository.dart';

class AddCategoryController extends GetxController {
    final CategoriesRepository repository;
    AddCategoryController(this.repository);
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController categoryNameArabicController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? file;

  void addCategory() {
    if (formKey.currentState!.validate()) {
      repository.addCategory(
        name: categoryNameController.text,
        nameAr: categoryNameArabicController.text,
        file: file!,
      );
      
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
