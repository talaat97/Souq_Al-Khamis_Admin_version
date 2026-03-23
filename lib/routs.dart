import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/core/middleware/mymiddleware.dart';

import 'package:souq_al_khamis_admin_version/features/auth/login.dart';
import 'package:souq_al_khamis_admin_version/features/categories/view/add_category_page.dart';
import 'package:souq_al_khamis_admin_version/features/categories/view/edit_category_page.dart';
import 'package:souq_al_khamis_admin_version/features/categories/view/categories_page.dart';
import 'package:souq_al_khamis_admin_version/features/categories/bindings/categories_binding.dart';
import 'package:souq_al_khamis_admin_version/features/home/home.dart';
import 'package:souq_al_khamis_admin_version/features/items/view/view_items_page.dart';
import 'package:souq_al_khamis_admin_version/features/items/view/add_item_page.dart';
import 'package:souq_al_khamis_admin_version/features/items/view/edit_item_page.dart';
import 'package:souq_al_khamis_admin_version/features/items/bindings/items_binding.dart';
import 'package:souq_al_khamis_admin_version/features/notification/bindings/notification_binding.dart';
import 'package:souq_al_khamis_admin_version/features/notification/view/notification_page.dart';

import 'package:souq_al_khamis_admin_version/features/order/bindings/order_binding.dart';
import 'package:souq_al_khamis_admin_version/features/order/view/order_screen.dart';
import 'package:souq_al_khamis_admin_version/features/order/view/order_detail_screen.dart';
import 'package:souq_al_khamis_admin_version/features/delivery/view/delivery_screen.dart';
import 'package:souq_al_khamis_admin_version/features/delivery/bindings/delivery_binding.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => Login(), middlewares: [
    Mymiddleware(),
  ]),
  //////////////////////////Auth//////////////////////
  GetPage(name: AppRoute.login, page: () => const Login()),
  ////////////////////////////////// home //////////////////////
  GetPage(name: AppRoute.home, page: () => const HomePage()),
  ////////////////////////////////// categories //////////////////////
  GetPage(
      name: AppRoute.categoriesPage,
      page: () => const CategoriesPage(),
      binding: CategoriesBinding()),
  GetPage(name: AppRoute.addCategory, page: () => const AddCategory()),
  GetPage(
      name: AppRoute.editCategory,
      page: () => const EditCategoryPage(),
      binding: CategoriesBinding()),
  ////////////////////////////////// items //////////////////////
  GetPage(
      name: AppRoute.itemsPage,
      page: () => const ItemsPage(),
      binding: ItemsBinding()),
  GetPage(
      name: AppRoute.addItemPage,
      page: () => const AddItemPage(),
      binding: ItemsBinding()),
  GetPage(
      name: AppRoute.editItemPage,
      page: () => const EditItemPage(),
      binding: ItemsBinding()),
  GetPage(
    name: AppRoute.notificationsPage,
    page: () => const NotificationPage(),
    binding: NotificationBinding(),
  ),
  ////////////////////////////////// Order //////////////////////
  GetPage(
      name: AppRoute.viewOrders,
      page: () => const OrderScreen(),
      binding: OrderBinding()),
  GetPage(
      name: AppRoute.orderDetails,
      page: () => const OrderDetailScreen(),
      binding: OrderDetailBinding()),
  ////////////////////////////////// Delivery //////////////////////
  GetPage(
      name: AppRoute.deliveriesPage,
      page: () => const DeliveryScreen(),
      binding: DeliveryBinding()),
];
