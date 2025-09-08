import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/controller/notification/view.dart';
import 'package:souq_al_khamis_admin_version/core/class/handling_data.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(NotificationController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("الاشعـــــرات"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              controller.goToHome();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: GetBuilder<NotificationController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Flexible(
                    flex: 9,
                    child: ListView.builder(
                      itemCount: controller.notificationList.length,
                      itemBuilder: (context, index) => Card(
                          child: ListTile(
                        leading: Text(
                            controller.notificationList[index].notificationId!),
                        title: Text(controller
                            .notificationList[index].notificationTitle!),
                        subtitle: Text(controller
                            .notificationList[index].notificationBody!),
                      )),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        controller.reloadMoreNtification(
                            controller.notificationList.length);
                      },
                      child: const Text(
                        "تحميل المزيد",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.primaryColor, // لون الخط
                            decorationThickness: 2, // سمك الخط
                            color: AppColor.primaryColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
