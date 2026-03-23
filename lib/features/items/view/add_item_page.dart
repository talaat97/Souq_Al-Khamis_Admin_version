import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/features/items/controllers/add.dart';
import 'package:souq_al_khamis_admin_version/core/shared/app_text_form_field.dart';
import 'package:souq_al_khamis_admin_version/features/items/view/widgets/image_upload_card_item.dart';
import '../../../../core/constant/colors.dart';

class AddItemPage extends GetView<AddItemsController> {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_item_title'.tr),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          children: [
            /// Item Name (English)
            AppTextFormField(
              controller: controller.itemNameController,
              backgroundColor: AppColor.surfaceColor,
              hintText: 'item_name_en'.tr,
              validator: (value) => value == null || value.isEmpty
                  ? 'item_name_required'.tr
                  : null,
            ),
            SizedBox(height: 18),

            /// Item Name (Arabic)
            AppTextFormField(
              controller: controller.itemNameArabicController,
              backgroundColor: AppColor.surfaceColor,
              hintText: 'item_name_ar'.tr,
              validator: (value) => value == null || value.isEmpty
                  ? 'item_name_ar_required'.tr
                  : null,
            ),
            SizedBox(height: 18),

            /// Description (English)
            AppTextFormField(
              controller: controller.itemDescriptionController,
              backgroundColor: AppColor.surfaceColor,
              hintText: 'item_description_en'.tr,
              maxLines: 3,
              validator: (value) => value == null || value.isEmpty
                  ? 'item_description_required'.tr
                  : null,
            ),
            SizedBox(height: 18),

            /// Description (Arabic)
            AppTextFormField(
              controller: controller.itemDescriptionArabicController,
              backgroundColor: AppColor.surfaceColor,
              hintText: 'item_description_ar'.tr,
              maxLines: 3,
              validator: (value) => value == null || value.isEmpty
                  ? 'item_description_ar_required'.tr
                  : null,
            ),
            SizedBox(height: 18),

            /// Count
            AppTextFormField(
              controller: controller.itemCountController,
              backgroundColor: AppColor.surfaceColor,
              hintText: 'item_count'.tr,
              keyboardType: TextInputType.number,
              validator: (value) => value == null || value.isEmpty
                  ? 'item_count_required'.tr
                  : null,
            ),
            SizedBox(height: 18),

            /// Price
            AppTextFormField(
              controller: controller.itemPriceController,
              backgroundColor: AppColor.surfaceColor,
              hintText: 'item_price'.tr,
              keyboardType: TextInputType.number,
              validator: (value) => value == null || value.isEmpty
                  ? 'item_price_required'.tr
                  : null,
            ),
            SizedBox(height: 18),

            /// Discount
            AppTextFormField(
              controller: controller.itemDiscountController,
              backgroundColor: AppColor.surfaceColor,
              hintText: 'item_discount'.tr,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return null;
                final discount = int.tryParse(value);
                if (discount == null || discount < 0 || discount > 100) {
                  return 'item_discount_invalid'.tr;
                }
                return null;
              },
            ),
            SizedBox(height: 18),

            /// Category ID
            AppTextFormField(
              controller: controller.itemCategoryIdController,
              backgroundColor: AppColor.surfaceColor,
              hintText: 'item_category_id'.tr,
              keyboardType: TextInputType.number,
              validator: (value) => value == null || value.isEmpty
                  ? 'item_category_required'.tr
                  : null,
            ),
            SizedBox(height: 18),

            /// Active/Available Switch
            GetBuilder<AddItemsController>(
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
                      'item_available'.tr,
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
            GetBuilder<AddItemsController>(
              builder: (controller) => UploadImageCardItem(
                file: controller.file,
                onUpload: controller.uploadFile,
                newFile: null,
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
            controller.addItem();
          },
          child: Text(
            'add_item_btn'.tr,
            style: const TextStyle(
                color: AppColor.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
