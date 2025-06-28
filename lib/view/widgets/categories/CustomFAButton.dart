import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/controller/categories/categories_contollre.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/view/widgets/categories/CustomAddBottomShet.dart';

class CustomFAButtons extends StatelessWidget {
  const CustomFAButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var categoriesController = Get.put(CategoriesController());
    return GetBuilder<CategoriesController>(
        builder: (controller) => Stack(
              children: [
                if (!categoriesController.modeEdit)
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            categoriesController.toEditMode();
                          },
                          icon: Icon(Icons.edit, size: 20),
                          label: Text('edit Categories'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 25),
                            backgroundColor:
                                AppColor.secondColor, // AppColor.primaryColor
                            foregroundColor: Colors.white,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        ElevatedButton.icon(
                          onPressed: () {
                            categoriesController.goToAddCategory();
                          },
                          icon: Icon(Icons.add, size: 20),
                          label: Text('add Categories'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 25),
                            backgroundColor:
                                AppColor.primaryColor, // AppColor.primaryColor
                            foregroundColor: Colors.white,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (categoriesController.modeEdit)
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        categoriesController.toEditMode();
                      },
                      icon: Icon(Icons.cancel_outlined, size: 20),
                      label: Text('Cancel Edit'),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                        backgroundColor:
                            AppColor.redColor, // AppColor.primaryColor
                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
              ],
            ));
  }
}
