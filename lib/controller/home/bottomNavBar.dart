import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/view/screens/order/accepted.dart';
import 'package:souq_al_khamis_admin_version/view/screens/order/archive.dart';
import 'package:souq_al_khamis_admin_version/view/screens/order/home.dart';

import 'package:souq_al_khamis_admin_version/view/screens/setting/setting_page.dart';

abstract class BottomNavBarController extends GetxController {
  changePage(int i);
}

class BottomNavBarControllerImp extends BottomNavBarController {
  int currentPage = 0;
  List<Widget> listPage = [
    PendingOrders(),
    AcceptedOrders(),
    ArchiveOrders(),
    SettingPage(),
  ];
  List titlePage = [
    {
      "title": '45'.tr,
      "icon": Icons.pending_actions_rounded,
    },
    {
      "title": '46'.tr,
      "icon": Icons.task_alt_sharp,
    },
    {
      "title": '47'.tr,
      "icon": Icons.archive_outlined,
    },
    {
      "title": '48'.tr,
      "icon": Icons.settings,
    },
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
