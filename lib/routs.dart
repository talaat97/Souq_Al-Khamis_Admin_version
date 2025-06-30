import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/core/middleware/mymiddleware.dart';

import 'package:souq_al_khamis_admin_version/view/screens/auth/login.dart';
import 'package:souq_al_khamis_admin_version/view/screens/categories/addCategory.dart';
import 'package:souq_al_khamis_admin_version/view/screens/categories/categoriesPage.dart';
import 'package:souq_al_khamis_admin_version/view/screens/home/home.dart';
import 'package:souq_al_khamis_admin_version/view/screens/items/addItem.dart';
import 'package:souq_al_khamis_admin_version/view/screens/items/itemsPage.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => HomePage(), middlewares: [
    Mymiddleware(),
  ]),
  //////////////////////////Auth//////////////////////
  GetPage(name: AppRoute.login, page: () => const Login()),
  ////////////////////////////////// home //////////////////////
  GetPage(name: AppRoute.home, page: () => const HomePage()),
  ////////////////////////////////// categories //////////////////////
  GetPage(name: AppRoute.categoriesPage, page: () => const CategoriesPage()),
  GetPage(name: AppRoute.addCategory, page: () => const AddCategory()),
  ////////////////////////////////// items //////////////////////
  GetPage(name: AppRoute.itemsPage, page: () => const ItemsPage()),
  GetPage(name: AppRoute.addItem, page: () => const AddItemPage()),
];
