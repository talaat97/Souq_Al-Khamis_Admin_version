import '../../../../core/class/curd.dart';
import '../../../../core/constant/links_api.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);

  getPendingOrders() async {
    var response = await crud.postData(Applink.home, {});
    return response.fold((l) => l, (r) => r);
  }

  getAcceptedOrders(String deliveryId) async {
    var response = await crud.postData(Applink.acceptedOrders, {
      'id': deliveryId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getArchiveOrders(String deliveryId) async {
    var response = await crud.postData(Applink.archiveOrders, {
      'id': deliveryId,
    });
    return response.fold((l) => l, (r) => r);
  }

  orderApprove(data) async {
    var response = await crud.postData(Applink.approveOrder, data);
    return response.fold((l) => l, (r) => r);
  }
}
