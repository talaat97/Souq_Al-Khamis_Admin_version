import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/pendingController.dart';
import '../../../core/class/handling_data.dart';
import '../../../core/constant/colors.dart';
import '../../widgets/home/card_admin_come.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
        titleTextStyle: TextStyle(
            color: AppColor.white, fontSize: 22, fontWeight: FontWeight.bold),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<HomeController>(
        builder: (pageController) => HandlingDataView(
            statusRequest: pageController.statusRequest,
            widget: ListView(
              padding: EdgeInsets.all(10),
              children: [
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 170,
                    crossAxisSpacing: 5,
                  ),
                  children: [
                    CardAdminHome(
                        title: 'notifaction',
                        imageUrl: 'assets/image/notifaction.png'),
                    CardAdminHome(
                        title: 'message', imageUrl: 'assets/image/message.png'),
                    CardAdminHome(
                        title: 'order', imageUrl: 'assets/image/order.png'),
                    CardAdminHome(
                        title: 'product', imageUrl: 'assets/image/product.png'),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
