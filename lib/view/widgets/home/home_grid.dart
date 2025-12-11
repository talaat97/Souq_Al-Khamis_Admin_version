import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/view/widgets/home/card_admin_come.dart';
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
                title: 'الاصنــــــاف',
                imageUrl: 'assets/image/category.jpeg',
                navigartTo: controller.goToCategoriesPage,
              ),
              CardAdminHome(
                title: 'المنتـــاجات',
                imageUrl: 'assets/image/product.png',
                navigartTo: controller.goToItemsPage,
              ),
              CardAdminHome(
                title: 'الاشعـــــرات',
                imageUrl: 'assets/image/notifaction.png',
                navigartTo: controller.goToNotificationsPage,
              ),
              CardAdminHome(
                title: 'الطلبــــات',
                imageUrl: 'assets/image/order.png',
                navigartTo: controller.goToViewOrdersPage,
              ),
              const CardAdminHome(
                title: 'message',
                imageUrl: 'assets/image/message.png',
              ),
              const CardAdminHome(
                title: 'الطيــــارين',
                imageUrl: 'assets/image/delivery.png',
              ),
            ],
          ),
        ],
      );
    });
  }
}
