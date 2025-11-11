import 'package:flutter/material.dart';

import 'package:souq_al_khamis_admin_version/core/shared/app_text_form_field.dart';

import '../../../core/constant/colors.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Category'),
        ),
        body: Form(
          child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: 4, // 6 fields + 1 button
            separatorBuilder: (context, index) => const SizedBox(height: 16),
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
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: AppColor.grey200,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.grey600!, width: 1.3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 110, color: AppColor.grey),
                      SizedBox(height: 7),
                      Text(
                        'Tap to upload category image',
                        style: TextStyle(color: AppColor.grey),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  label: const Text('Add Category'),
                ),
              ];

              return fields[index];
            },
          ),
        ));
  }
}
