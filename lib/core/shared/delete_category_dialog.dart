import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/core/constant/styles.dart';


class DeleteCategoryDialog extends StatelessWidget {
  final Future<void> Function() onConfirm;

  const DeleteCategoryDialog({
    super.key,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.cardBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔴 Icon
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.errorColor.withOpacity(0.12),
              ),
              child: const Icon(
                Icons.delete_outline,
                color: AppColor.errorColor,
                size: 32,
              ),
            ),

            const SizedBox(height: 16),

            // 📝 Title
            Text(
              'Delete Category',
              style: TextStyles.font18DarkBlueBold,
            ),

            const SizedBox(height: 8),

            // 📄 Message
            Text(
              'Are you sure you want to delete this category?',
              textAlign: TextAlign.center,
              style: TextStyles.font14GrayRegular,
            ),

            const SizedBox(height: 24),

            // 🔘 Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColor.neutralLight,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyles.font14DarkBlueMedium,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await onConfirm();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.errorColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      'Delete',
                      style: TextStyles.font16WhiteSemiBold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
