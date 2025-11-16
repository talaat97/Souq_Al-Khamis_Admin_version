import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/controller/home/home_controller.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController controller;
  const HomeAppBar({super.key, required this.controller});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      centerTitle: true,
      title: const Text('الصفحة الرئيسية'),
      actions: [
        Obx(() {
          return IconButton(
            onPressed: controller.toggleGrid,
            icon: Icon(
              controller.gridCount.value == 2
                  ? Icons.grid_view
                  : controller.gridCount.value == 3
                      ? Icons.grid_3x3
                      : Icons.view_module,
              size: 26,
            ),
            tooltip: "تغير شكل الأيقونات",
          );
        })
      ],
    );
  }
}
