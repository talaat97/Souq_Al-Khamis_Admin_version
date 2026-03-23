import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/features/home/widgets/card_admin_come.dart';
import 'package:souq_al_khamis_admin_version/controller/home/home_controller.dart';

class HomeGrid extends StatelessWidget {
  final HomeController controller;
  const HomeGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView(
        padding: const EdgeInsets.all(15),
        children: [
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: controller.gridCount.value,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            children: [
              CardAdminHome(
                title: 'categories'.tr,
                imageUrl: 'assets/image/category.jpeg',
                navigartTo: controller.goToCategoriesPage,
              ),
              CardAdminHome(
                title: 'products'.tr,
                imageUrl: 'assets/image/product.png',
                navigartTo: controller.goToItemsPage,
              ),
              CardAdminHome(
                title: 'notifications'.tr,
                imageUrl: 'assets/image/notifaction.png',
                navigartTo: controller.goToNotificationsPage,
              ),
              CardAdminHome(
                title: 'orders'.tr,
                imageUrl: 'assets/image/order.png',
                navigartTo: controller.goToViewOrdersPage,
              ),
              CardAdminHome(
                title: 'messages'.tr,
                imageUrl: 'assets/image/message.png',
              ),
              CardAdminHome(
                title: 'delivery_agents'.tr,
                imageUrl: 'assets/image/delivery.png',
                navigartTo: controller.goToDeliveriesPage,
              ),
            ],
          ),
        ],
      );
    });
  }
}
