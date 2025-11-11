import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_svg/svg.dart';
import '../../../controller/categories/view_controller.dart';
import '../../../link_api.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CategoriesController());
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
            return GestureDetector(
              onTap: () {},
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.network(
                      '${Applink.categoriesLink}/${controller.categories[index].categoriesImage}',
                      height: 90,
                      placeholderBuilder: (context) =>
                          CircularProgressIndicator(),
                    ),
                    Text(controller.categories[index].categoriesName!),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.goToAddCategoryPage();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        label: Text('Add Category'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
