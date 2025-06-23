import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:souq_al_khamis_admin_version/core/class/handling_data.dart';
import 'package:souq_al_khamis_admin_version/core/function/order_functions.dart';
import 'package:souq_al_khamis_admin_version/view/widgets/order/accepted_card_theme.dart';

import '../../../controller/order/acceptedController.dart';

class AcceptedOrders extends StatelessWidget {
  const AcceptedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedController());
    return GetBuilder<AcceptedController>(
      builder: (pageController) => HandlingDataView(
        statusRequest: pageController.statusRequest,
        widget: ListView.builder(
          itemCount: pageController.acceptedOrders.length,
          itemBuilder: (context, index) => AcceptedThemeCard(
            statusRequest: pageController.statusRequest,
            color: colorCard(pageController.acceptedOrders[index].orderStatus!),
            orderModel: pageController.acceptedOrders[index],
            goToOrderDetails: () {
              pageController
                  .goToOrderDetails(pageController.acceptedOrders[index]);
            },
          ),
        ),
      ),
    );
  }
}
