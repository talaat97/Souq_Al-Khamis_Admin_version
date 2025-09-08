import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/controller/order/acceptedController.dart';

import '../../core/class/status_request.dart';

import '../../core/constant/routs_page.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/function/notification_helper.dart';
import '../../core/services/services.dart';
import '../../data/datacorse/static/model/order_model.dart';
import '../../data/datacorse/remote/orders/OrdersData.dart';

class HomeController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  List<OrderModel> ordersPending = [];
  String namePage = 'pending';
  dynamic accessToken;
  var acceptedController = Get.put(AcceptedController());
  getPendingOrders() async {
    ordersPending.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getPendingOrders();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        ordersPending.addAll(responseData.map((e) => OrderModel.fromJson(e)));
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void goToOrderDetails(OrderModel orderModel) {
    Get.toNamed(AppRoute.orderDeitails, arguments: {
      'orderModel': orderModel,
    });
  }

  orderApprove(OrderModel orderModel) async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await NotificationsHelper().getAccessToken();
    Map data = {
      "deliveryId":
          myServices.sharedPreferences.getString('deliveryId').toString(),
      "deviceToken": orderModel.orderUserDevicetoken,
      "deliveryName":
          myServices.sharedPreferences.getString('deliveryName').toString(),
      "userId": orderModel.orderUserid,
      "orderId": orderModel.orderId,
      "accessToken": accessToken,
      "userDeviceToken": orderModel.orderUserDevicetoken,
    };
    var response = await ordersData.orderApprove(data);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getPendingOrders();
        acceptedController.getAcceptedOrders();
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    getPendingOrders();

    super.onInit();
  }
}
