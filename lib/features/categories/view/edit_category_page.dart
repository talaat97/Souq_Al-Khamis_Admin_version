import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/features/categories/controllers/edit.dart';
import 'package:souq_al_khamis_admin_version/core/shared/app_text_form_field.dart';
import 'package:souq_al_khamis_admin_version/features/categories/view/widgets/image_upload_card.dart';
import '../../../core/constant/colors.dart';

class EditCategoryPage extends GetView<EditCategoryController> {
  const EditCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Category'),
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Column(
            children: [
              /// Category Name (English)
              AppTextFormField(
                controller: controller.categoryNameController,
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Category Name (English)',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter category name'
                    : null,
              ),
              SizedBox(height: 18),

              /// Category Name (Arabic)
              AppTextFormField(
                controller: controller.categoryNameArabicController,
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Category Name (Arabic)',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter category name'
                    : null,
              ),

              SizedBox(height: 18),

              /// IMAGE UPLOAD
              GetBuilder<EditCategoryController>(
                builder: (controller) => UploadImageCard(
                  file: controller.file,
                  onUpload: controller.uploadFile,
                  title: 'Change Category Image',
                  subtitle: 'SVG recommended (optional)',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: MaterialButton(
          height: 60,
          minWidth: double.infinity,
          color: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: () {
            controller.editCategory();
          },
          child: const Text(
            'Update Item',
            style: TextStyle(color: AppColor.white),
          ),
        ),
      ),
    );
  }
}
