import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:souq_al_khamis_admin_version/core/class/handling_data.dart';
import '../../../controller/categories/view_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../link_api.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ViewController());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GetBuilder<ViewController>(
        builder: (_) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              itemCount: controller.categories.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return Card(
                  color: const Color(0xFFFFEEE0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 3,
                  child: InkWell(
                    onTap: () {
                      debugPrint('Tapped ${category.categoriesName}');
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.network(
                            "${Applink.categoriesLink}/${category.categoriesImage}",
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
                              category.categoriesName!,
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
                                  //TODO Edit category action
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.redAccent),
                                onPressed: () {
                                  //TODO Delete category action
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
        ),
      ),
      // Replace FAB with PopupMenuButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.goToAddCategoryPage();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
