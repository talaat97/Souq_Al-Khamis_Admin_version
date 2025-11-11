import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_svg/svg.dart';
import '../../../controller/categories/view_controller.dart';
import '../../../core/constant/colors.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = const [
      {'name': 'Electronics', 'icon': 'assets/svg/shose.svg'},
      {'name': 'Clothing', 'icon': 'assets/svg/shose.svg'},
      {'name': 'Furniture', 'icon': 'assets/svg/phone.svg'},
      {'name': 'Groceries', 'icon': 'assets/svg/dress.svg'},
      {'name': 'Toys', 'icon': 'assets/svg/shose.svg'},
      {'name': 'Books', 'icon': 'assets/svg/phone.svg'},
      {'name': 'Shoes', 'icon': 'assets/svg/shose.svg'},
      {'name': 'Beauty', 'icon': 'assets/svg/dress.svg'},
    ];

    var controller = Get.put(ViewController());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          itemCount: categories.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final category = categories[index];
            return Card(
              color: const Color(0xFFFFEEE0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              child: InkWell(
                onTap: () {
                  debugPrint('Tapped ${category['name']}');
                },
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        category['icon']!,
                        height: 75,
                        width: 50,
                        colorFilter: ColorFilter.mode(
                          AppColor.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          category['name']!,
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit,
                                color: AppColor.secondaryColor),
                            onPressed: () {
                              debugPrint('Edit ${category['name']}');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete,
                                color: Colors.redAccent),
                            onPressed: () {
                              debugPrint('Delete ${category['name']}');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // Replace FAB with PopupMenuButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Colors.white, size: 30),
          onSelected: (value) {
            switch (value) {
              case 'add':
                controller.goToAddCategoryPage();
                break;
              case 'edit':
                debugPrint('Edit category action');
                break;
              case 'delete':
                debugPrint('Delete category action');
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'add',
              child: Row(
                children: const [
                  Icon(Icons.add, color: Colors.black),
                  SizedBox(width: 10),
                  Text('Add Category'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'edit',
              child: Row(
                children: const [
                  Icon(Icons.edit, color: Colors.black),
                  SizedBox(width: 10),
                  Text('Edit Category'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: const [
                  Icon(Icons.delete, color: Colors.redAccent),
                  SizedBox(width: 10),
                  Text('Delete Category'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
