import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/features/delivery/controller/delivery_controller.dart';
import 'package:souq_al_khamis_admin_version/core/class/handling_data.dart';
import 'package:souq_al_khamis_admin_version/features/delivery/view/widgets/delivery_card.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

class DeliveryScreen extends GetView<DeliveryController> {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Deliveries'),
      ),
      body: Obx(() {
        return HandlingDataView(
          statusRequest: controller.status.value,
          widget: NotificationListener<ScrollNotification>(
            onNotification: (scroll) {
              if (scroll.metrics.pixels == scroll.metrics.maxScrollExtent) {
                controller.loadMore();
              }
              return false;
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: controller.deliveries.length +
                  (controller.hasMore.value ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == controller.deliveries.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final delivery = controller.deliveries[index];
                return DeliveryCard(
                  delivery: delivery,
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
