import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/core/function/upload_file.dart';
import 'package:souq_al_khamis_admin_version/features/items/data/repositories/items_repository.dart';

import '../../../core/class/status_request.dart';

class AddItemsController extends GetxController {
  final ItemsRepository repository;
  AddItemsController(this.repository);

  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemNameArabicController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();
  TextEditingController itemDescriptionArabicController =
      TextEditingController();
  TextEditingController itemCountController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  TextEditingController itemDiscountController = TextEditingController();
  TextEditingController itemCategoryIdController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? file;
  bool isActive = true;
  StatusRequest statusRequest = StatusRequest.loading;

  void toggleActive(bool value) {
    isActive = value;
    update();
  }

  void addItem() async {
    // ── 1. Validate form ──────────────────────────
    if (!formKey.currentState!.validate()) {
      Get.snackbar(
        'Error',
        'Some fields are empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.errorColor.withOpacity(0.6),
        colorText: AppColor.white,
      );
      return;
    }

    // ── 2. Validate image ─────────────────────────
    if (file == null) {
      Get.snackbar(
        'Error',
        'Please upload an image',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.errorColor.withOpacity(0.6),
        colorText: AppColor.white,
      );
      return;
    }

    // ── 3. Send ───────────────────────────────────
    statusRequest = StatusRequest.loading; // ✅
    update();

    final response = await repository.addItem(
      name: itemNameController.text,
      nameAr: itemNameArabicController.text,
      description: itemDescriptionController.text,
      descriptionAr: itemDescriptionArabicController.text,
      count: itemCountController.text,
      price: itemPriceController.text,
      discount: itemDiscountController.text.isEmpty
          ? '0'
          : itemDiscountController.text,
      active: isActive ? '1' : '0',
      categoryId: itemCategoryIdController.text,
      file: file!,
    );

    statusRequest = StatusRequest.success; // ✅
    update();

    // ── 4. Handle response ────────────────────────
    response.fold(
      (failure) => Get.snackbar(
        'Error',
        'Failed to add item, try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.errorColor.withOpacity(0.6),
        colorText: AppColor.white,
      ),
      (success) {
        Get.snackbar('Success', 'Item added successfully');
        goToHome();
      },
    );
  }

  void uploadFile() async {
    File? selectedFile = await fileUploadGallery();

    if (selectedFile != null) {
      statusRequest = StatusRequest.loading; // ✅ show loading while compressing
      update();

      File? compressed = await compressImage(selectedFile);

      statusRequest = StatusRequest.success;
      update();

      if (compressed == null) {
        Get.snackbar(
          'Error',
          'Failed to process image, try again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      file = compressed;
      update();
    }
  }

  void goToHome() {
    Get.offAllNamed(AppRoute.home);
  }

  @override
  void onClose() {
    itemNameController.dispose();
    itemNameArabicController.dispose();
    itemDescriptionController.dispose();
    itemDescriptionArabicController.dispose();
    itemCountController.dispose();
    itemPriceController.dispose();
    itemDiscountController.dispose();
    itemCategoryIdController.dispose();
    super.onClose();
  }
}
