import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/view/widgets/home/card_admin_come.dart';

import '../../../controller/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('الصفحة الرئيسية'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            children: [
              CardAdminHome(
                title: 'notifaction',
                imageUrl: 'assets/image/notifaction.png',
              ),
              CardAdminHome(
                  title: 'message', imageUrl: 'assets/image/message.png'),
              CardAdminHome(title: 'order', imageUrl: 'assets/image/order.png'),
              CardAdminHome(
                title: 'المنتـــاجات',
                imageUrl: 'assets/image/product.png',
                navigartTo: () {
                  homeController.goToItemsPage();
                },
              ),
              CardAdminHome(
                  title: 'الاصنــــــاف',
                  imageUrl: 'assets/image/category.jpeg',
                  navigartTo: () {
                    homeController.goToCategoriesPage();
                  }),
              CardAdminHome(
                title: 'الطيــــارين',
                imageUrl: 'assets/image/delivery.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
