import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/core/constant/links_api.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/core/function/upload_file.dart';
import 'package:souq_al_khamis_admin_version/features/items/data/models/item_model.dart';
import 'package:souq_al_khamis_admin_version/features/items/data/repositories/items_repository.dart';

class EditItemsController extends GetxController {
  final ItemsRepository repository;
  EditItemsController(this.repository);
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemNameArabicController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();
  TextEditingController itemDescriptionArabicController =
      TextEditingController();
  TextEditingController itemCountController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  TextEditingController itemDiscountController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? file;
  File? newFile; // Track if user selected a new file
  late ItemModel item;
  bool isActive = true;

  @override
  void onInit() {
    super.onInit();
    // Get item data from arguments
    item = Get.arguments;

    // Pre-populate form fields
    itemNameController.text = item.iteamsName ?? '';
    itemNameArabicController.text = item.iteamsNameAr ?? '';
    itemDescriptionController.text = item.iteamsDec ?? '';
    itemDescriptionArabicController.text = item.iteamsDecAr ?? '';
    itemCountController.text = item.iteamsCount ?? '';
    itemPriceController.text = item.iteamsPrice ?? '';
    itemDiscountController.text = item.iteamsDiscount ?? '';
    isActive = item.iteamsActive == '1';

    // Create a File object with the network URL for display purposes
    var imagePath = '${Applink.imagePathItems}/${item.iteamsImage!}';
    file = File(imagePath);
    log('Initial image path: ${file!.path}');
  }

  void toggleActive(bool value) {
    isActive = value;
    update();
  }

  void editItem() {
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
      repository.editItem(
        itemId: item.iteamsId!,
        name: itemNameController.text,
        nameAr: itemNameArabicController.text,
        description: itemDescriptionController.text,
        descriptionAr: itemDescriptionArabicController.text,
        count: itemCountController.text,
        price: itemPriceController.text,
        discount: itemDiscountController.text,
        active: isActive ? '1' : '0',
        imageOld: item.iteamsImage!,
        file: newFile, // Send the new file, or null if keeping existing
      );

      Get.snackbar('Success', 'Item updated successfully');
      goToHome();
    }
  }

  void goToHome() {
    Get.offAllNamed(AppRoute.home);
  }

  void uploadFile() async {
    File? selectedFile = await fileUploadGallery();

    if (selectedFile != null) {
      // Compress before storing
      File? compressed = await compressImage(selectedFile);

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

      newFile = compressed;
      update();
    }
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
    super.onClose();
  }
}
