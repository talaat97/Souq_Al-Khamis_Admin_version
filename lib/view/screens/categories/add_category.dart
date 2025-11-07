import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:souq_al_khamis_admin_version/controller/categories/view_controller.dart';
import 'package:souq_al_khamis_admin_version/core/shared/app_text_form_field.dart';

import '../../../core/constant/colors.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    var categoriesController = Get.find<CategoriesController>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Category'),
        ),
        body: Form(
          key: categoriesController.formKey,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: 7, // 6 fields + 1 button
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final fields = [
                    AppTextFormField(
                      hintText: 'Category Name',
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter category name'
                          : null,
                    ),
                    AppTextFormField(
                      hintText: 'Category Name Arabic',
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter category name'
                          : null,
                    ),
                    AppTextFormField(
                      hintText: 'Category Description',
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter category description'
                          : null,
                    ),
                    AppTextFormField(
                      hintText: 'Category Description Arabic',
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter category description'
                          : null,
                    ),
                    AppTextFormField(
                      hintText: 'Category Price',
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter category price'
                          : null,
                    ),
                    AppTextFormField(
                      hintText: 'Category Count',
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter category count'
                          : null,
                    ),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.done, size: 20),
                      label: const Text('Add Category'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 25),
                        backgroundColor: AppColor.secondColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ];

                  return fields[index];
                },
              )),
        ));
  }
}
