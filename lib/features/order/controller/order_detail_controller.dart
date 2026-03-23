import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/curd.dart';
import 'package:souq_al_khamis_admin_version/core/constant/links_api.dart';
import 'package:souq_al_khamis_admin_version/features/order/data/models/order_model.dart';
import 'package:souq_al_khamis_admin_version/features/order/controller/order_controller.dart';

class OrderDetailController extends GetxController {
  final Crud crud;
  OrderDetailController(this.crud);

  late Rx<OrderModel> order;
  final isLoadingAction = false.obs;

  @override
  void onInit() {
    order = (Get.arguments as OrderModel).obs;
    super.onInit();
  }

  Future<void> approveOrder() async {
    if (isLoadingAction.value) return;
    isLoadingAction.value = true;

    try {
      final response = await crud.postData(
        Applink.approveOrder,
        {
          "orderId": order.value.orderId.toString(),
          "userid": order.value.orderUserId.toString(),
          "deviceToken": order.value.orderUserDeviceToken ?? ""
        },
      );

      response.fold(
        (failure) {
          Get.snackbar('error'.tr, 'order_approve_error'.tr);
        },
        (data) {
          if (data['status'] == "success") {
            Get.snackbar('success'.tr, 'order_approve_success'.tr);

            // Advance local status blindly for smoothness or trigger a refresh
            // order.update((val) { val?.orderStatus = 1; });
            Get.find<OrderController>().refreshOrders();
            Get.back(); // close summary
          } else {
            Get.snackbar('error'.tr, 'order_approve_error'.tr);
          }
        },
      );
    } finally {
      isLoadingAction.value = false;
    }
  }

  Future<void> cancelOrder(String reason) async {
    if (isLoadingAction.value) return;
    isLoadingAction.value = true;

    try {
      final response = await crud.postData(
        Applink.cancelOrder,
        {
          "orderId": order.value.orderId.toString(),
          "userid": order.value.orderUserId.toString(),
          "deviceToken": order.value.orderUserDeviceToken ?? "",
          "status": "0",
          "reason": reason
        },
      );

      final orderCtrl = Get.find<OrderController>();
      orderCtrl.refreshOrders();

      response.fold(
        (failure) {
          orderCtrl.pendingMessage.value = 'order_cancel_notice'.tr;
        },
        (data) {
          if (data['status'] == "success") {
            orderCtrl.pendingMessage.value = 'order_cancelled'.tr;
          } else {
            orderCtrl.pendingMessage.value = 'order_cancel_error'.tr;
          }
        },
      );

      // Close dialog (if open) + detail screen in one clean call
      if (Get.isDialogOpen == true) {
        Get.close(2);
      } else {
        Get.back();
      }
    } finally {
      isLoadingAction.value = false;
    }
  }

  Future<void> updateDeliveryStatus(String type) async {
    if (isLoadingAction.value) return;
    isLoadingAction.value = true;

    try {
      final response = await crud.postData(
        Applink.deliveryUpdate,
        {
          "orderId": order.value.orderId.toString(),
          "userid": order.value.orderUserId.toString(),
          "deviceToken": order.value.orderUserDeviceToken ?? "",
          "type": type // '0'=out for delivery, '1'=delivered
        },
      );

      response.fold(
        (failure) {
          Get.snackbar("Error", "Action Failed.");
        },
        (data) {
          if (data['status'] == "success") {
            Get.snackbar("Success", "Order status updated!");
            Get.find<OrderController>().refreshOrders();
            Get.back();
          } else {
            Get.snackbar("Error", "Failed locally.");
          }
        },
      );
    } finally {
      isLoadingAction.value = false;
    }
  }
}
