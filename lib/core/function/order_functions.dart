import 'dart:ui';

import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

printOrderType(String val) {
  return val == '0' ? 'Delivery' : 'Receive';
}

printOrrderPaymentMethod(String val) {
  return val == '0' ? 'cash' : 'payment cart';
}

printDeliverPriceOrder(String val) {
  return val == '0' ? 'no delivey price' : val;
}

Color getOrderColor(String status) {
  switch (status) {
    case '0':
      return OrderStatusColor.waiting;
    case '1':
      return OrderStatusColor.approve;
    case '2':
      return OrderStatusColor.preparing;
    case '3':
      return OrderStatusColor.shipping;
    case '4':
      return OrderStatusColor.archived;
    default:
      return OrderStatusColor.waiting;
  }
}

String getOrderStatusText(String status) {
  switch (status) {
    case '0':
      return "Approve Order";
    case '1':
      return "Start Preparing";
    case '2':
      return "Mark as Shipping";
    case '3':
      return "Complete Order";
    case '4':
      return "Archived";
    default:
      return "";
  }
}
