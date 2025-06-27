import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/handling_data.dart';
import '../../../controller/order/pendingController.dart';
import '../../widgets/home/card_admin_come.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<HomeController>(
        builder: (pageController) => HandlingDataView(
            statusRequest: pageController.statusRequest,
            widget: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisExtent: 180),
              children: [
                CardAdminHome(
                    title: 'notifaction',
                    imageUrl: 'assets/image/notifaction.png'),
                CardAdminHome(
                    title: 'message', imageUrl: 'assets/image/message.png'),
                CardAdminHome(
                    title: 'order', imageUrl: 'assets/image/order.png'),
                CardAdminHome(
                    title: 'order', imageUrl: 'assets/image/order.png'),
              ],
            )),
      ),
    );
  }
}
