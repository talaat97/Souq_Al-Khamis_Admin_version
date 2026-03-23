import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/handling_data.dart';
import 'package:souq_al_khamis_admin_version/features/items/controllers/view.dart';
import 'package:souq_al_khamis_admin_version/features/items/view/widgets/item_card.dart';
import '../../../core/constant/colors.dart';

class ItemsPage extends GetView<ItemsController> {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Items'),
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
              padding: const EdgeInsets.all(12),
              itemCount:
                  controller.items.length + (controller.hasMore.value ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == controller.items.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final item = controller.items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ItemCard(
                    item: item,
                    onEdit: () {
                      controller.goToEditItemPage(item);
                    },
                    onDelete: () {
                      controller.deleteItem(
                        item.iteamsId!,
                        item.iteamsImage!,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.goToAddItemPage();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
