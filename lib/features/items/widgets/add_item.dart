import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../core/function/show_image_picker_sheet.dart';
import '../../../core/shared/app_text_form_field.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  bool available = true; // availability toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body: Form(
        child: ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: 8, // total fields
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final fields = [
              /// Item Name (EN)
              AppTextFormField(
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Item Name',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter item name'
                    : null,
              ),

              /// Item Name (AR)
              AppTextFormField(
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Item Name Arabic',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter Arabic item name'
                    : null,
              ),

              /// Description
              AppTextFormField(
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Description',
                maxLines: 3,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter description'
                    : null,
              ),

              /// Arabic Description
              AppTextFormField(
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Description Arabic',
                maxLines: 3,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter Arabic description'
                    : null,
              ),

              /// COUNT FIELD
              AppTextFormField(
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Count',
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter count'
                    : null,
              ),

              /// AVAILABILITY SWITCH
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textPrimary,
                    ),
                  ),
                  Switch(
                    value: available,
                    activeColor: AppColor.primaryColor,
                    inactiveThumbColor: AppColor.textPrimary,
                    inactiveTrackColor: AppColor.grey600,
                    onChanged: (value) {
                      setState(() {
                        available = value;
                      });
                    },
                  ),
                ],
              ),

              /// IMAGE UPLOAD
              GestureDetector(
                onTap: () {
                  showImagePickerSheet(context); // <-- BottomSheet function
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
