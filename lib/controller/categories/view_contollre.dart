import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/core/function/handling_data_controller.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/remote/categories/categories_data.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/static/model/category_model.dart';

class CategoriesController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController arTitleController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest? statusRequest;
  List<CategoryModel> categories = [];
  bool modeEdit = false;
  bool modeDelete = false;
  bool bottomSheetVisible = false;

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  getCategories() async {
    statusRequest = StatusRequest.loading;
    update();
    categories.clear();
    var response = await categoriesData.getCategories();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        categories.addAll(responseData.map((e) => CategoryModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

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
