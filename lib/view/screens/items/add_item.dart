import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/shared/app_text_form_field.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/styles.dart';

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
                hintText: 'Item Name',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter item name'
                    : null,
              ),

              /// Item Name (AR)
              AppTextFormField(
                hintText: 'Item Name Arabic',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter Arabic item name'
                    : null,
              ),

              /// Description
              AppTextFormField(
                hintText: 'Description',
                maxLines: 3,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter description'
                    : null,
              ),

              /// Arabic Description
              AppTextFormField(
                hintText: 'Description Arabic',
                maxLines: 3,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter Arabic description'
                    : null,
              ),

              /// COUNT FIELD
              AppTextFormField(
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
                  _showImagePickerSheet(context); // <-- BottomSheet function
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

void _showImagePickerSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColor.surfaceColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
    ),
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top handle
            Container(
              height: 5,
              width: 55,
              decoration: BoxDecoration(
                color: AppColor.grey600,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),

            // Sheet Title
            Text(
              'Choose Image Source',
              style: TextStyles.font18DarkBlueBold.copyWith(
                color: AppColor.textPrimary,
              ),
            ),

            const SizedBox(height: 25),

            /// CAMERA OPTION
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.camera_alt,
                    color: AppColor.primaryColor, size: 28),
              ),
              title: Text(
                'Take from Camera',
                style: TextStyles.font15DarkBlueMedium.copyWith(
                  color: AppColor.textPrimary,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                //TODO _pickFromCamera();
              },
            ),

            /// GALLERY OPTION
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.tertiaryColor.withOpacity(0.20),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.photo_library,
                    color: AppColor.tertiaryColor, size: 28),
              ),
              title: Text(
                'Pick from Gallery',
                style: TextStyles.font15DarkBlueMedium.copyWith(
                  color: AppColor.textPrimary,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                //TODO _pickFromGallery();
              },
            ),

            const SizedBox(height: 15),
          ],
        ),
      );
    },
  );
}
