import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/controller/items/items_controller.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/static/model/category_model.dart';

class CategoriesPage extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoriesPage({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItemsByCategoryController());

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
          bottom: TabBar(
            isScrollable: true,
            tabs: categories.map((c) => Tab(text: c.categoriesNameAr)).toList(),
          ),
        ),
        body: TabBarView(
          children: categories.map((c) {
            return GetBuilder<ItemsByCategoryController>(
              id: "tab-${c.categoriesId}",
              builder: (ctrl) {
                final status = ctrl.statusByCategory[c.categoriesId];
                final items = ctrl.itemsByCategory[c.categoriesId];

                // لو لسه ما طلبناش البيانات
                if (status == null) {
                  // نعمل الطلب أول مرة
                  Future.microtask(() => ctrl.getItems(c.categoriesId));
                  return const Center(child: Text("Loading..."));
                }

                if (status == StatusRequest.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (status == StatusRequest.failure) {
                  return const Center(child: Text("Failed to load items"));
                }

                if (items == null || items.isEmpty) {
                  return const Center(child: Text("No items found"));
                }

                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) =>
                      ListTile(title: Text(items[index].itemName)),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
