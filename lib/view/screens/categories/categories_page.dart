import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_svg/svg.dart';
import '../../../controller/categories/view_contollre.dart';
import '../../../link_api.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GetBuilder<CategoriesController>(
        builder: (controller) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.5 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: controller.categories.length, // Example item count
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.network(
                    '${Applink.categoriesLink}/${controller.categories[index].categoriesImage}',
                    height: 80,
                    width: 80,
                    placeholderBuilder: (context) =>
                        CircularProgressIndicator(),
                  ),
                  Text(controller.categories[index].categoriesName!),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
