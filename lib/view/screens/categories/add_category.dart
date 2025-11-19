import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/categories/add_controller.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AddCategoryController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Category'),
        ),
        body: Form(
          key: controller.formKey,
          child: GetBuilder<AddCategoryController>(
              builder: (_) => Column(
                    children: [],
                  )),
        ));
  }
}
