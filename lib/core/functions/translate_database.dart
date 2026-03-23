import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/controllers/language_controller.dart';

/// Helper function to return the correct database field based on the current app language.
/// It checks if the current language is Arabic; if so, it returns [arName], otherwise [enName].
String translateDatabase(String? arName, String? enName) {
  try {
    final languageController = Get.find<LanguageController>();
    if (languageController.isArabic) {
      return arName ?? "";
    } else {
      return enName ?? "";
    }
  } catch (e) {
    // Fallback if controller is not found
    return enName ?? "";
  }
}
