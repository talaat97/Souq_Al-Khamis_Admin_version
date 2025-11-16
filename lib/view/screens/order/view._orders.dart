import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:souq_al_khamis_admin_version/core/class/handling_data.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/view/screens/order/dummy_order_data.dart';
import 'package:souq_al_khamis_admin_version/view/widgets/order/accepted_card_theme.dart';

import '../../../controller/order/accepted_controller.dart';
import '../../../core/function/order_functions.dart';

final orders = dummyOrderList;

class ViewOrders extends StatelessWidget {
  const ViewOrders({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(AcceptedController());
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) => AcceptedThemeCard(
          orderModel: orders[index],
          color: AppColor.tertiaryColor,
          goToOrderDetails: () {}),
    );
  }
}
     // widget: ListView.builder(
          //   itemCount: pageController.acceptedOrders.length,
          //   itemBuilder: (context, index) => AcceptedThemeCard(
          //     statusRequest: pageController.statusRequest,
          //     color: colorCard(pageController.acceptedOrders[index].orderStatus!),
          //     orderModel: pageController.acceptedOrders[index],
          //     goToOrderDetails: () {
          //       pageController
          //           .goToOrderDetails(pageController.acceptedOrders[index]);
          //     },
          //   ),
          // ),