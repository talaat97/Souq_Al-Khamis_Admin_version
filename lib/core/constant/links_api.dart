class Applink {
  ///server = 'http://loca/ecommerce/admin' if using emulator
  ///server = 'http://192.168.1.1/ecommerce/admin' if using physical device
  static const String ip = '192.168.1.6';
  static const String server = 'http://$ip/ecommerce/admin';
  //============================================ image ============================================//
  static const String imagePathCategories =
      'http://$ip/ecommerce/upload/categories';
  static const String imagePathItems = 'http://$ip/ecommerce/upload/iteams';
  //============================================ Auth ============================================//
  static const String loginLink = '$server/Auth/login.php';

  //============================================ orders ============================================//
  // Orders
  static const String viewOrders = '$server/orders/view.php';
  static const String orderDetails = '$server/orders/view_details.php';
  static const String approveOrder = '$server/orders/approve.php';
  static const String deliveryUpdate = '$server/orders/delivery_update.php';
  //============================================ items ============================================//
  static const String itemsView = '$server/items/view.php';
  static const String itemsAdd = '$server/items/add.php';
  static const String itemsDelete = '$server/items/delete.php';
  static const String itemsEdit = '$server/items/edit.php';
  //============================================ categories ============================================//
  static const String categoriesView = '$server/categories/view.php';

  static const String categoriesAdd = '$server/categories/add.php';
  static const String categoriesDelete = '$server/categories/delete.php';
  static const String categoriesEdit = '$server/categories/edit.php';
  //============================================ deliveries ============================================//
  static const String deliveriesView = '$server/deliverys/view.php';
  //============================================ notification ============================================//
  static const String notification = '$server/notification/view.php';
}
