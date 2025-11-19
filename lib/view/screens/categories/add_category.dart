import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:souq_al_khamis_admin_version/core/shared/app_text_form_field.dart';

import '../../../controller/categories/add_controller.dart';
import '../../../core/constant/colors.dart';

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
