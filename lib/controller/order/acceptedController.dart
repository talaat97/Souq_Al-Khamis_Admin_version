import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/controller/order/archivedController.dart';

import '../../core/class/status_request.dart';

import '../../core/constant/routs_page.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/function/notification_helper.dart';
import '../../core/services/services.dart';
import '../../data/datacorse/static/model/order_model.dart';
import '../../data/datacorse/remote/orders/OrdersData.dart';

class AcceptedController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  List<OrderModel> acceptedOrders = [];
  late String? accessToken;
  var archivedcontroller = Get.put(Archivedcontroller());
  getAcceptedOrders() async {
    acceptedOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getAcceptedOrders(
      myServices.sharedPreferences.getString('deliveryId').toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        acceptedOrders.addAll(responseData.map((e) => OrderModel.fromJson(e)));
        statusRequest = StatusRequest.sucess;
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
    getAcceptedOrders();
    super.onInit();
  }
}
