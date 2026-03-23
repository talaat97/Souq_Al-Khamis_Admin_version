import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/core/shared/delete_category_dialog.dart';

import 'package:souq_al_khamis_admin_version/features/items/data/models/item_model.dart';
import 'package:souq_al_khamis_admin_version/features/items/data/repositories/items_repository.dart';

class ItemsController extends GetxController {
  final ItemsRepository repository;

  ItemsController(this.repository);

  final items = <ItemModel>[].obs;
  final status = StatusRequest.loading.obs;

  final isLoadingMore = false.obs;
  final hasMore = true.obs;

  int offset = 0;
  int limit = 10;

  @override
  void onInit() {
    fetchInitial();
    super.onInit();
  }

  Future<void> fetchInitial() async {
    status.value = StatusRequest.loading;
    offset = 0;
    items.clear();
    repository.clearCache();

    try {
      final result = await repository.fetchItems(offset, limit);

      result.fold(
        (failure) => status.value = failure,
        (data) {
          items.assignAll(data);
          data.length < limit ? hasMore.value = false : hasMore.value = true;
          status.value = StatusRequest.success;
        },
      );
    } catch (e) {
      status.value = e as StatusRequest;
    }
  }

  Future<void> loadMore() async {
    if (!hasMore.value || isLoadingMore.value) return;
    isLoadingMore.value = true;
    try {
      offset += limit;
      final result = await repository.fetchItems(offset, limit);
      result.fold(
        (failure) {
      
        },
        (data) {
          offset += limit;
          items.addAll(data);
          data.length < limit ? hasMore.value = false : hasMore.value = true;
        },
      );
    } finally {
      hasMore.value = false;
      isLoadingMore.value = false;
    }
  }

  void goToAddItemPage() {
    Get.toNamed(AppRoute.addItemPage);
  }

  void goToEditItemPage(ItemModel item) {
    Get.toNamed(AppRoute.editItemPage, arguments: item);
  }

  deleteItem(String itemId, String imageName) async {
    Get.dialog(
      DeleteCategoryDialog(
        onConfirm: () async {
          final response =
              await repository.deleteItem(itemId: itemId, imageName: imageName);

          response.fold((failure) => status.value = failure, (unit) {
            fetchInitial();
          });
        },
      ),
    );
  }

  void goBack() => Get.back();
}
