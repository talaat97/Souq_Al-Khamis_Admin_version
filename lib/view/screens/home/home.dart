import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';
import '../../widgets/home/card_admin_come.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
        titleTextStyle: TextStyle(
            color: AppColor.white, fontSize: 22, fontWeight: FontWeight.bold),
        backgroundColor: AppColor.primaryColor,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1,
            ),
            children: [
              CardAdminHome(
                  title: 'notifaction',
                  imageUrl: 'assets/image/notifaction.png'),
              CardAdminHome(
                  title: 'message', imageUrl: 'assets/image/message.png'),
              CardAdminHome(title: 'order', imageUrl: 'assets/image/order.png'),
              CardAdminHome(
                  title: 'product', imageUrl: 'assets/image/product.png'),
              CardAdminHome(
                  title: 'delivery', imageUrl: 'assets/image/delivery.png'),
            ],
          ),
        ],
      ),
    );
  }
}
