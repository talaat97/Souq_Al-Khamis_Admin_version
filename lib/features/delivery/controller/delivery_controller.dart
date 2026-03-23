import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/curd.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';
import 'package:souq_al_khamis_admin_version/core/constant/links_api.dart';
import 'package:souq_al_khamis_admin_version/features/delivery/data/models/delivery_model.dart';

class DeliveryController extends GetxController {
  final Crud crud;

  DeliveryController(this.crud);

  final deliveries = <DeliveryModel>[].obs;
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
    deliveries.clear();

    try {
      final response = await crud.postData(
        Applink.deliveriesView,
        {
          "offset": offset.toString(),
          "limit": limit.toString(),
        },
      );

      response.fold(
        (failure) {
          status.value = failure;
        },
        (data) {
          if (data['status'] == "success") {
            List listdata = data['data'];
            deliveries.assignAll(
                listdata.map((e) => DeliveryModel.fromJson(e)).toList());
            if (listdata.length < limit) {
              hasMore.value = false;
            } else {
              hasMore.value = true;
            }
            status.value = StatusRequest.success;
          } else {
            status.value = StatusRequest.failure;
          }
        },
      );
    } catch (e) {
      status.value = StatusRequest.serverExaption;
    }
  }

  Future<void> loadMore() async {
    if (!hasMore.value || isLoadingMore.value) return;
    isLoadingMore.value = true;
    try {
      offset += limit;
      final response = await crud.postData(
        Applink.deliveriesView,
        {
          "offset": offset.toString(),
          "limit": limit.toString(),
        },
      );

      response.fold(
        (failure) {
          // You could show a snackbar here if pagination fails, or silently fail and allow retry
        },
        (data) {
          if (data['status'] == "success") {
            List listdata = data['data'];
            deliveries.addAll(
                listdata.map((e) => DeliveryModel.fromJson(e)).toList());
            if (listdata.length < limit) {
              hasMore.value = false;
            } else {
              hasMore.value = true;
            }
          } else {
            hasMore.value = false;
          }
        },
      );
    } finally {
      isLoadingMore.value = false;
    }
  }

  void goBack() => Get.back();
}
