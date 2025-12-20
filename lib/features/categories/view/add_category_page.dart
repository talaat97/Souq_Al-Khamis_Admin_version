import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:souq_al_khamis_admin_version/features/categories/controllers/add.dart';
import 'package:souq_al_khamis_admin_version/core/shared/app_text_form_field.dart';

import '../../../core/constant/colors.dart';
import '../../../core/function/upload_file.dart';

class AddCategory extends GetView<AddCategoryController> {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Category'),
      ),
      body: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            child: Column(
              children: [
                /// Category Name
                AppTextFormField(
                  backgroundColor: AppColor.surfaceColor,
                  hintText: 'Category Name',
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter category name'
                      : null,
                ),
                SizedBox(height: 18),

                /// Category Description
                AppTextFormField(
                  backgroundColor: AppColor.surfaceColor,
                  hintText: 'Category Description',
                  maxLines: 3,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter category description'
                      : null,
                ),
                SizedBox(height: 18),

                /// IMAGE UPLOAD
                GestureDetector(
                  onTap: () async {
                    await fileUploadGallary(true);
                  },
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.surfaceColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColor.grey600!, width: 1.3),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 110, color: AppColor.grey),
                        const SizedBox(height: 7),
                        Text(
                          'Tap to upload item image',
                          style: TextStyle(color: AppColor.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),

                /// SUBMIT BUTTON
                ElevatedButton.icon(
                  onPressed: () {
                    controller.addCategory();
                    //  Navigator.pop(context);
                  },
                  label: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 110, vertical: 5),
                    child: const Text('Add Item'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
