import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:souq_al_khamis_admin_version/features/categories/controllers/view.dart';
import 'package:souq_al_khamis_admin_version/core/class/handling_data.dart';
import 'package:souq_al_khamis_admin_version/features/categories/view/widgets/category_card.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

class CategoriesPage extends GetView<CategoriesController> {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Categories'),
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
              itemCount: controller.categories.length +
                  (controller.hasMore.value ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == controller.categories.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final category = controller.categories[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CategoryCard(
                    category: category,
                    onEdit: () {
                      // TODO: Edit category action
                    },
                    onDelete: () {
                      // TODO: Delete category action
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
          controller.goToAddCategoryPage();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
