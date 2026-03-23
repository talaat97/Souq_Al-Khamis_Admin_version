import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/features/categories/controllers/add.dart';
import 'package:souq_al_khamis_admin_version/core/shared/app_text_form_field.dart';
import 'package:souq_al_khamis_admin_version/features/categories/view/widgets/image_upload_card_category.dart';
import '../../../core/constant/colors.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Column(
            children: [
              /// Category Name
              AppTextFormField(
                controller: controller.categoryNameController,
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Category Name (English)',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter category name'
                    : null,
              ),
              SizedBox(height: 18),

              /// Category Name
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
              GetBuilder<AddCategoryController>(
                builder: (controller) => UploadImageCardCategoty(
                  file: controller.file,
                  onUpload: controller.uploadFile,
                  // onRemove: controller.removeFile,
                  title: 'Upload Category Image',
                  subtitle: 'SVG recommended',
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
            controller.addCategory();
            //  Navigator.pop(context);
          },
          child: const Text(
            'Add Item',
            style: TextStyle(color: AppColor.white),
          ),
        ),
      ),
    );
  }
}
