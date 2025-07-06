import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/static/model/category_model.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/static/model/item_model.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routs_page.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datacorse/remote/items/item_data.dart';

class ItemController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController arTitleController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<ItemModel> items = [];
  List<CategoryModel> categories = [];
  ItemData itemsData = ItemData(Get.find());
  MyServices myServices = Get.find();
  String? catName;
  StatusRequest statusRequest = StatusRequest.loading;

  @override
  void onInit() {
    getIems('1');
    super.onInit();
  }

  getIems(String categortId) async {
    statusRequest = StatusRequest.loading;
    update();
    items.clear();
    categories.clear();

    var response = await itemsData.getItems(categortId);

    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['items'];
        items.addAll(responseData.map((e) => ItemModel.fromJson(e)));

        //======//
        List responseData2 = response['categories'];
        categories.addAll(responseData2.map((e) => CategoryModel.fromJson(e)));

        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
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

  goToAddItemPage() {
    Get.toNamed(AppRoute.addItem);
  }

  getItemsByCategory(categoryId) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getItems(
      categoryId.toString(),
    );
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['items'];
        items.addAll(responseData.map((e) => ItemModel.fromJson(e)).toList());
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
