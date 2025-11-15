class Applink {
  //localhost= 10.0.2.2
  static const String server = 'http://10.0.2.2/ecommerce/admin';
  //============================================ image ============================================//
  static const String categoriesLink =
      'http://10.0.2.2/ecommerce/upload/categories';
  //============================================ Auth ============================================//
  static const String loginLink = '$server/Auth/login.php';

  //============================================ orders ============================================//
  static const String home = '$server/orders/view.php';
  static const String acceptedOrders = '$server/orders/prepare.php';
  static const String archiveOrders = '$server/orders/archive.php';
  static const String approveOrder = '$server/orders/approve.php';
  // static const String doneOrder = '$server/orders/done.php';
  //============================================ items ============================================//
  static const String itemsView = '$server/items/view.php';
  //============================================ categories ============================================//
  static const String categoriesView = '$server/categories/view.php';
  static const String categoriesAdd = '$server/categories/add.php';
  static const String categoriesDelete = '$server/categories/delete.php';
  static const String categoriesEdit = '$server/categories/edit.php';
  //============================================ notification ============================================//
  static const String notification = '$server/notification/view.php';
}
