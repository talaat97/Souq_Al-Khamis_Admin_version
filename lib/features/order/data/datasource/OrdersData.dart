import '../../../../core/class/curd.dart';
import '../../../../core/constant/links_api.dart';

class OrdersData {
  final Crud crud;
  OrdersData(this.crud);

  getOrders({
    required String status,  // "all" or "0"–"4"
    required int limit,
    required int offset,
  }) async {
    var response = await crud.postData(Applink.viewOrders, {
      'status': status,
      'limit':  limit,
      'offset': offset,
    });
    return response.fold((l) => l, (r) => r);
  }

  getOrderDetails({required String orderId}) async {
    var response = await crud.postData(Applink.orderDetails, {
      'orderId': orderId,
    });
    return response.fold((l) => l, (r) => r);
  }

  approveOrder({
    required String orderId,
    required String userId,
    required String deviceToken,
  }) async {
    var response = await crud.postData(Applink.approveOrder, {
      'orderId':     orderId,
      'userid':      userId,
      'deviceToken': deviceToken,
    });
    return response.fold((l) => l, (r) => r);
  }

  // type=0 → status 1→2 (start preparing)
  // type=1 → status 2→3 (send for delivery)
  // type=2 → status 3→4 (mark delivered)
  updateOrderStatus({
    required String orderId,
    required String userId,
    required String deviceToken,
    required String type,
  }) async {
    var response = await crud.postData(Applink.deliveryUpdate, {
      'orderId':     orderId,
      'userid':      userId,
      'deviceToken': deviceToken,
      'type':        type,
    });
    return response.fold((l) => l, (r) => r);
  }
}