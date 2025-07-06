import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routs_page.dart';
import '../../core/services/services.dart';
import '../../data/datacorse/static/model/orderDetailsModel.dart';
import '../../data/datacorse/static/model/order_model.dart';
import '../../data/datacorse/remote/orders/orderDetailsData.dart';

class Orderdetailscontroller extends GetxController {
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  Completer<GoogleMapController>? googleMapController;
  CameraPosition? cameraPosition;
  Marker? myMarker;
  List<Marker> marker = [];
  List<OrderDetailsModel> orderDetailsList = [];
  late OrderModel orderModel;
  Position? position;

  intialData() {
    if (orderModel.addressLat != null && orderModel.addressLang != null) {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(orderModel.addressLat!),
            double.parse(orderModel.addressLang!)),
        zoom: 12.4,
      );
      marker.add(Marker(
          markerId: const MarkerId('1'),
          position: LatLng(double.parse(orderModel.addressLat!),
              double.parse(orderModel.addressLang!))));
    }
  }

  itemPriceDiscount(price, discount) {
    return price - (price * (discount / 100));
  }

  void goToOrderDetails(OrderModel orderModel) {
    Get.toNamed(AppRoute.orderDeitails, arguments: {
      'orderModel': orderModel,
    });
  }

  @override
  void onInit() {
    orderModel = Get.arguments['orderModel'];
    intialData();
    googleMapController = Completer<GoogleMapController>();
    super.onInit();
  }
}
