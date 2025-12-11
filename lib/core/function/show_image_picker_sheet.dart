import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

import '../constant/styles.dart';

void showImagePickerSheet(BuildContext context) {
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
