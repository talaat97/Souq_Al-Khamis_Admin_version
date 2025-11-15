import 'dart:developer';

import 'package:get/get.dart';

import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/core/function/handling_data_controller.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/remote/categories/categories_data.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/static/model/category_model.dart';

class ViewCategoryController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  List<CategoryModel> categories = [];

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  getCategories() async {
    statusRequest = StatusRequest.loading;
    categories.clear();
    update();
    var response = await categoriesData.view();
    statusRequest = handlingData(response);
    log("==============================");
    log(statusRequest.toString());
    log("==============================");

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        categories.addAll(responseData.map((e) => CategoryModel.fromJson(e)));
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void goToAddCategoryPage() {
    Get.toNamed(AppRoute.addCategory);
  }
}
