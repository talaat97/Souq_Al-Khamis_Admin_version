import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/core/constant/links_api.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/core/function/upload_file.dart';
import 'package:souq_al_khamis_admin_version/features/categories/data/models/category_model.dart';
import 'package:souq_al_khamis_admin_version/features/categories/data/repositories/categories_repository.dart';

class EditCategoryController extends GetxController {
  final CategoriesRepository repository;
  EditCategoryController(this.repository);
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController categoryNameArabicController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? file;
  File? newFile; // Track if user selected a new file
  late CategoryModel category;

  @override
  void onInit() {
    super.onInit();
    // Get category data from arguments
    category = Get.arguments;

    // Pre-populate form fields
    categoryNameController.text = category.categoriesName!;
    categoryNameArabicController.text = category.categoriesNameAr!;

    // Create a File object with the network URL for display purposes
    var imagePath =
        '${Applink.imagePathCategories}/${category.categoriesImage!}';
    file = File(imagePath);
    log('Initial image path: ${file!.path}');
  }

  void editCategory() {
    if (formKey.currentState!.validate() == false) {
      Get.snackbar(
        'Error',
        'Some fields are empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.errorColor.withOpacity(0.6),
        colorText: AppColor.white,
        duration: Duration(seconds: 3),
      );
      return;
    }

    if (formKey.currentState!.validate()) {
      // If user selected a new file, send it. Otherwise send null to keep existing image
      repository.editCategory(
        categoryId: category.categoriesId!,
        name: categoryNameController.text,
        nameAr: categoryNameArabicController.text,
        imageOld: category.categoriesImage!,
        file: newFile, // Send the new file, or null if keeping existing
      );

      Get.snackbar('Success', 'Category updated successfully');
      goToHome();
    }
  }

  void goToHome() {
    Get.offAllNamed(AppRoute.home);
  }

  void uploadFile() async {
    File? selectedFile = await fileUploadGallery(true);
    if (selectedFile != null) {
      file = selectedFile;
      newFile = selectedFile; // Track that user selected a new file
      log('New file selected: ${file!.path}');
      update();
    }
  }

  @override
  void onClose() {
    categoryNameController.dispose();
    categoryNameArabicController.dispose();
    super.onClose();
  }
}
