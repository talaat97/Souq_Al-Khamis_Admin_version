import 'package:get/get.dart';

import '../../core/constant/routs_page.dart';

class HomeController extends GetxController {
  goToDelivetyPage() {
    Get.toNamed(AppRoute.deliveriesPage);
  }

  goToCategoriesPage() {
    Get.toNamed(AppRoute.categoriesPage);
  }

  goToItemsPage() {
    Get.toNamed(AppRoute.itemsPage);
  }

  goToOrdersPage() {
    Get.toNamed(AppRoute.ordersPage);
  }

  goToNotificationsPage() {
    Get.toNamed(AppRoute.notifcationsPage);
  }
}
