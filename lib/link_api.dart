class Applink {
  //localhost= 10.0.2.2
  static const String server = 'http://10.0.2.2/ecommerce/admin';
  //============================================ Auth ============================================//
  static const String loginLink = '$server/Auth/login.php';
  //============================================ orders ============================================//
  static const String home = '$server/orders/view.php';
  static const String acceptedOrders = '$server/orders/prepare.php';
  static const String archiveOrders = '$server/orders/archive.php';
  static const String approveOrder = '$server/orders/approve.php';
  // static const String doneOrder = '$server/orders/done.php';
  //============================================ orders ============================================//
  static const String items = '$server/items/items.php';
}
