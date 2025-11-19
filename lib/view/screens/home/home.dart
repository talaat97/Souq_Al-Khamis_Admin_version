
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/home_controller.dart';
import 'package:souq_al_khamis_admin_version/view/widgets/home/home_grid.dart';
import 'package:souq_al_khamis_admin_version/view/widgets/home/home_app_bar.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    return Scaffold(
      appBar: HomeAppBar(controller: homeController),
      body: HomeGrid(controller: homeController),
    );
  }
}
