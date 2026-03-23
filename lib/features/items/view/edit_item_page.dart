import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/features/items/controllers/edit.dart';
import 'package:souq_al_khamis_admin_version/core/shared/app_text_form_field.dart';
import 'package:souq_al_khamis_admin_version/features/items/data/models/item_model.dart';
import 'package:souq_al_khamis_admin_version/features/items/view/widgets/image_upload_card_item.dart';
import '../../../../core/constant/colors.dart';

class EditItemPage extends GetView<EditItemsController> {
  const EditItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            children: [
              /// Item Name (English)
              AppTextFormField(
                controller: controller.itemNameController,
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Item Name (English)',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter item name'
                    : null,
              ),
              SizedBox(height: 18),

              /// Item Name (Arabic)
              AppTextFormField(
                controller: controller.itemNameArabicController,
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Item Name (Arabic)',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter item name in Arabic'
                    : null,
              ),
              SizedBox(height: 18),

              /// Description (English)
              AppTextFormField(
                controller: controller.itemDescriptionController,
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Description (English)',
                maxLines: 3,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter description'
                    : null,
              ),
              SizedBox(height: 18),

              /// Description (Arabic)
              AppTextFormField(
                controller: controller.itemDescriptionArabicController,
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Description (Arabic)',
                maxLines: 3,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter description in Arabic'
                    : null,
              ),
              SizedBox(height: 18),

              /// Count
              AppTextFormField(
                controller: controller.itemCountController,
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Count',
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter count'
                    : null,
              ),
              SizedBox(height: 18),

              /// Price
              AppTextFormField(
                controller: controller.itemPriceController,
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Price',
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter price'
                    : null,
              ),
              SizedBox(height: 18),

              /// Discount
              AppTextFormField(
                controller: controller.itemDiscountController,
                backgroundColor: AppColor.surfaceColor,
                hintText: 'Discount (%)',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  final discount = int.tryParse(value);
                  if (discount == null || discount < 0 || discount > 100) {
                    return 'Discount must be between 0 and 100';
                  }
                  return null;
                },
              ),
              SizedBox(height: 18),

              /// Active/Available Switch
              GetBuilder<EditItemsController>(
                builder: (controller) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColor.surfaceColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
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
                        value: controller.isActive,
                        activeColor: AppColor.primaryColor,
                        inactiveThumbColor: AppColor.textPrimary,
                        inactiveTrackColor: AppColor.grey600,
                        onChanged: controller.toggleActive,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18),

              /// IMAGE UPLOAD
              GetBuilder<EditItemsController>(
                builder: (controller) => UploadImageCardItem(
                  file: controller.file,
                  onUpload: controller.uploadFile,
                  newFile: controller.newFile,
                ),
              ),
            ],
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
              controller.editItem();
            },
            child: const Text(
              'Update Item',
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
