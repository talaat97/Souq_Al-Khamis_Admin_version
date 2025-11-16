import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:souq_al_khamis_admin_version/core/class/handling_data.dart';

import 'package:souq_al_khamis_admin_version/core/function/order_functions.dart';

import '../../../controller/order/archived_controller.dart';
import '../../widgets/order/archive_card_theme.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Archivedcontroller());
    return GetBuilder<Archivedcontroller>(
      builder: (pageController) => HandlingDataView(
        statusRequest: pageController.statusRequest,
        widget: ListView.builder(
          itemCount: pageController.archivedOrders.length,
          itemBuilder: (context, index) => ArchiveCardTheme(
            statusRequest: pageController.statusRequest,
            color: colorCard(pageController.archivedOrders[index].orderStatus!),
            orderModel: pageController.archivedOrders[index],
            goToOrderDetails: () {
              pageController.goToOrderDetails(pageController
                  .goToOrderDetails(pageController.archivedOrders[index]));
            },
          ),
        ),
      ),
    );
  }
}
