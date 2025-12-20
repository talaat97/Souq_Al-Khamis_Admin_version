import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/core/middleware/mymiddleware.dart';

import 'package:souq_al_khamis_admin_version/features/auth/login.dart';
import 'package:souq_al_khamis_admin_version/features/categories/view/add_category_page.dart';
import 'package:souq_al_khamis_admin_version/features/categories/view/categories_page.dart';
import 'package:souq_al_khamis_admin_version/features/categories/bindings/categories_binding.dart';
import 'package:souq_al_khamis_admin_version/features/home/home.dart';
import 'package:souq_al_khamis_admin_version/features/items/items_page.dart';
import 'package:souq_al_khamis_admin_version/features/items/widgets/add_item.dart';
import 'package:souq_al_khamis_admin_version/features/notification/bindings/notification_binding.dart';
import 'package:souq_al_khamis_admin_version/features/notification/view/notification_page.dart';

import 'features/order/view.dart';

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
  ////////////////////////////////// items //////////////////////
  GetPage(name: AppRoute.itemsPage, page: () => const ItemsPage()),
  GetPage(name: AppRoute.addItemPage, page: () => const AddItemPage()),

  GetPage(
    name: AppRoute.notificationsPage,
    page: () => const NotificationPage(),
    binding: NotificationBinding(),
  ),
  ////////////////////////////////// Order //////////////////////
  GetPage(name: AppRoute.viewOrders, page: () => const ViewOrders()),
];
