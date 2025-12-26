import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
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
    if (formKey.currentState!.validate() == false) {
      Get.snackbar(
        'Error',
        'Some fields are empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.errorColor.withOpacity(0.6),
        colorText: AppColor.white,
        duration: Duration(seconds: 3),
      );
    }
    if (file == null) {
      Get.snackbar(
        'Error',
        'Please upload an image (SVG)',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.errorColor.withOpacity(0.6),
        colorText: AppColor.white,
        duration: Duration(seconds: 3),
      );
    }
    if (formKey.currentState!.validate() && file != null) {
      repository.addCategory(
        name: categoryNameController.text,
        nameAr: categoryNameArabicController.text,
        file: file!,
      );

      Get.snackbar('Success', 'Category added successfully');
      goToHome();
    }
  }

  void goToHome() {
    Get.offAllNamed(AppRoute.home);
  }

  void uploadFile() async {
    file = await fileUploadGallary(true);
    update();
  }
}
