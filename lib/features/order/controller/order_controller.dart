import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/curd.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';
import 'package:souq_al_khamis_admin_version/core/constant/links_api.dart';
import 'package:souq_al_khamis_admin_version/features/order/data/models/order_model.dart';

class OrderController extends GetxController {
  final Crud crud;
  OrderController(this.crud);

  final orderList = <OrderModel>[].obs;
  final status = StatusRequest.loading.obs;

  final activeTab = 0.obs;

  // Status Maps (0:Cancelled, All, 1: Waiting, 2: Pending, 3: Shipping, 4: Archived)
  final List<String> apiStatusFilters = ["all", "1", "2", "3", "4", "0"];

  final isLoadingMore = false.obs;
  final hasMore = true.obs;

  late ScrollController scrollController;
  int offset = 0;
  int limit = 10;

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
    fetchInitial();
    super.onInit();
  }

  void onTabSwitched(int index) {
    if (activeTab.value == index) return;
    activeTab.value = index;
    fetchInitial();
  }

  void refreshOrders() {
    fetchInitial();
  }

  Future<void> fetchInitial() async {
    status.value = StatusRequest.loading;
    offset = 0;
    orderList.clear();

    try {
      final response = await crud.postData(
        Applink.viewOrders,
        {
          "offset": offset.toString(),
          "limit": limit.toString(),
          "status": apiStatusFilters[activeTab.value],
        },
      );

      response.fold(
        (failure) {
          status.value = failure;
        },
        (data) {
          if (data['status'] == "success") {
            List listData = data['data'];
            orderList.assignAll(
                listData.map((e) => OrderModel.fromJson(e)).toList());

            if (listData.length < limit) {
              hasMore.value = false;
            } else {
              hasMore.value = true;
            }
            status.value = StatusRequest.success;
          } else {
            hasMore.value = false;
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
        Applink.viewOrders,
        {
          "offset": offset.toString(),
          "limit": limit.toString(),
          "status": apiStatusFilters[activeTab.value],
        },
      );

      response.fold(
        (failure) {},
        (data) {
          if (data['status'] == "success") {
            List listData = data['data'];
            orderList
                .addAll(listData.map((e) => OrderModel.fromJson(e)).toList());

            if (listData.length < limit) {
              hasMore.value = false;
            } else {
              hasMore.value = true;
            }
          } else {
            hasMore.value = false;
          }
        },
      );
    } catch (e) {
      // safely ignore or log timeout
    } finally {
      isLoadingMore.value = false;
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
