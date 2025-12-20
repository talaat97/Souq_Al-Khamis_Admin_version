import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';
import 'package:souq_al_khamis_admin_version/core/function/handling_data_controller.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/remote/items/item_data.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/static/model/item_model.dart';

import '../../core/constant/routs_page.dart';

class ItemsViewController extends GetxController {
  ItemData itemData = ItemData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  List<ItemModel> items = [];

  @override
  void onInit() {
    getItems();
    super.onInit();
  }

  getItems() async {
    statusRequest = StatusRequest.loading;
    items.clear();
    update();
    var response = await itemData.view();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        items.addAll(responseData.map((e) => ItemModel.fromJson(e)));
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void goToAddItemPage() {
    Get.toNamed(AppRoute.addItemPage);
  }
}
