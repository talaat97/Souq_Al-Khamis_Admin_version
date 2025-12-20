import 'package:get/get.dart';

import '../../core/constant/routs_page.dart';

class HomeController extends GetxController {
  RxInt gridCount = 2.obs; // default 2 columns

  
  goToDelivetyPage() {
    Get.toNamed(AppRoute.deliveriesPage);
  }

  goToCategoriesPage() {
    Get.toNamed(AppRoute.categoriesPage);
  }

  goToItemsPage() {
    Get.toNamed(AppRoute.itemsPage);
  }

  goToViewOrdersPage() {
    Get.toNamed(AppRoute.viewOrders);
  }

  goToNotificationsPage() {
    Get.toNamed(AppRoute.notificationsPage);
  }

  void toggleGrid() {
    if (gridCount.value == 2) {
      gridCount.value = 3;
    } else if (gridCount.value == 3) {
      gridCount.value = 4;
    } else {
      gridCount.value = 2; // loop back
    }
  }
}
