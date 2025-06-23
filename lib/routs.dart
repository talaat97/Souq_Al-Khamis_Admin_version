import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/core/middleware/mymiddleware.dart';

import 'package:souq_al_khamis_admin_version/view/screens/auth/login.dart';
import 'package:souq_al_khamis_admin_version/view/screens/home/home.dart';
import 'package:souq_al_khamis_admin_version/view/screens/order/order_details_page.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => Login(), middlewares: [
    Mymiddleware(),
  ]),
  //////////////////////////Auth//////////////////////
  GetPage(name: AppRoute.login, page: () => const Login()),
  ////////////////////////////////// Order //////////////////////
  GetPage(name: AppRoute.home, page: () => const HomePage()),
  ////////////////////////////////// Order Details //////////////////////
  GetPage(name: AppRoute.orderDeitails, page: () => const OrderDetails()),
];
