import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/controller/categories/view_categories_contollre.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/view/widgets/categories/CustomCategoryButton.dart';

class CustomFAButtons extends StatelessWidget {
  const CustomFAButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var categoriesController = Get.put(CategoriesController());
    return GetBuilder<CategoriesController>(
        builder: (controller) => Stack(
              children: [
                if (!categoriesController.modeEdit &&
                    !categoriesController.modeDelete)
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomCategoryButton(
                          title: 'edit Categories',
                          colorButton: AppColor.secondColor,
                          onPressed: () {
                            categoriesController.switchEditMode();
                          },
                          icon: Icons.edit,
                        ),
                        SizedBox(height: 15),
                        CustomCategoryButton(
                          title: 'add Categories',
                          colorButton: AppColor.primaryColor,
                          icon: Icons.add,
                          onPressed: () {
                            categoriesController.goToAddCategory();
                          },
                        ),
                        SizedBox(height: 15),
                        CustomCategoryButton(
                          title: 'delete Categories',
                          colorButton: AppColor.redColor,
                          icon: Icons.delete,
                          onPressed: () {
                            categoriesController.switchDeleteMode();
                          },
                        ),
                      ],
                    ),
                  ),
                if (categoriesController.modeEdit &&
                    !categoriesController.bottomSheetVisible)
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: CustomCategoryButton(
                      title: 'Cancel Edit',
                      colorButton: AppColor.redColor,
                      icon: Icons.cancel,
                      onPressed: () {
                        categoriesController.switchEditMode();
                      },
                    ),
                  ),
                if (categoriesController.modeDelete)
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: CustomCategoryButton(
                      title: 'Cancel Delete',
                      colorButton: AppColor.redColor,
                      icon: Icons.cancel,
                      onPressed: () {
                        categoriesController.switchDeleteMode();
                      },
                    ),
                  ),
              ],
            ));
  }
}
