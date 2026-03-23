import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/core/controllers/language_controller.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final langController = Get.find<LanguageController>();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Obx(() {
        final isAr = langController.isArabic;
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.language,
                  size: 40, color: AppColor.primaryColor),
              const SizedBox(height: 12),
              Text(
                'change_language'.tr,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _LanguageTile(
                flag: '🇬🇧',
                label: 'English',
                isActive: !isAr,
                onTap: () {
                  langController.changeLanguage('en');
                  Get.back();
                },
              ),
              const SizedBox(height: 12),
              _LanguageTile(
                flag: '🇸🇦',
                label: 'العربية',
                isActive: isAr,
                onTap: () {
                  langController.changeLanguage('ar');
                  Get.back();
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      }),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final String flag;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _LanguageTile({
    required this.flag,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isActive
            ? AppColor.primaryColor.withOpacity(0.1)
            : Colors.grey.shade100,
        border: Border.all(
          color: isActive ? AppColor.primaryColor : Colors.grey.shade300,
          width: isActive ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Text(flag, style: const TextStyle(fontSize: 26)),
        title: Text(
          label,
          style: TextStyle(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? AppColor.primaryColor : AppColor.textPrimary,
          ),
        ),
        trailing: isActive
            ? const Icon(Icons.check_circle_rounded,
                color: AppColor.primaryColor)
            : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
