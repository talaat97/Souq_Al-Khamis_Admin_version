import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../core/function/upload_file.dart';
import '../../../core/shared/app_text_form_field.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Category'),
      ),
      body: Form(
        child: ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: 4, // total fields
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final fields = [
              /// Category Name
              AppTextFormField(
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Category Name',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter category name'
                    : null,
              ),

              /// Category Description
              AppTextFormField(
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Category Description',
                maxLines: 3,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter category description'
                    : null,
              ),

              /// IMAGE UPLOAD
              GestureDetector(
                onTap: () async {
                  await fileUploadGallary(true);
                },
                child: Container(
                  height: 250,
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

              /// SUBMIT BUTTON
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Item'),
              ),
            ];

            return fields[index];
          },
        ),
      ),
    );
  }
}
