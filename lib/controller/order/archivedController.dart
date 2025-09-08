import 'package:get/get.dart';

import '../../core/class/status_request.dart';

import '../../core/constant/routs_page.dart';
import '../../core/function/handling_data_controller.dart';

import '../../core/services/services.dart';
import '../../data/datacorse/static/model/order_model.dart';
import '../../data/datacorse/remote/orders/OrdersData.dart';

class Archivedcontroller extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  List<OrderModel> archivedOrders = [];

  getArchivedOrders() async {
    archivedOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getArchiveOrders(
      myServices.sharedPreferences.getString('deliveryId').toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        archivedOrders.addAll(responseData.map((e) => OrderModel.fromJson(e)));
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToOrderDetails(OrderModel orderModel) {
    Get.toNamed(AppRoute.orderDeitails, arguments: {
      'orderModel': orderModel,
    });
  }

  @override
  void onInit() {
    getArchivedOrders();
    super.onInit();
  }
}
