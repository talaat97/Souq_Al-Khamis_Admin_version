import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';
import 'package:souq_al_khamis_admin_version/core/function/handling_data_controller.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/remote/items/item_data.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/static/model/item_model.dart';

class ItemsController extends GetxController {
  final ItemData itemsData = ItemData(Get.find());

  Map<int, List<ItemModel>> itemsByCategory = {}; // categoryId -> items
  Map<int, StatusRequest> statusByCategory = {}; // categoryId -> status

  Future<void> getItems(int categoryId) async {
    if (statusByCategory[categoryId] == StatusRequest.loading) return;
    if (itemsByCategory[categoryId] != null) return; // already loaded ✅

    statusByCategory[categoryId] = StatusRequest.loading;
    update(["tab-$categoryId"]);

    var response = await itemsData.getItems(categoryId);
    var status = handlingData(response);

    if (status == StatusRequest.success && response['status'] == 'success') {
      List responseData = response['data'];
      itemsByCategory[categoryId] =
          responseData.map((e) => ItemModel.fromJson(e)).toList();
      statusByCategory[categoryId] = StatusRequest.success;
    } else {
      statusByCategory[categoryId] = StatusRequest.failure;
    }

    update(["tab-$categoryId"]);
  }
}
