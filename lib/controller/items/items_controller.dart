import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routs_page.dart';

class ItemController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController arTitleController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    arTitleController.dispose();
    imageController.dispose();
    super.onClose();
  }

  goToAddItemPage() {
    Get.toNamed(AppRoute.addItem);
  }
}
