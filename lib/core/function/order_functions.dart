import 'package:flutter/material.dart';
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

colorCard(String val) {
  if (val == '2') {
    return AppColor.yellowColor;
  }
  if (val == '3') {
    return AppColor.greenColor;
  }
  if (val == '4') {
    return Colors.grey;
  }
}
