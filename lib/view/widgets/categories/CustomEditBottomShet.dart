import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/controller/categories/categories_contollre.dart';

import '../../../core/constant/colors.dart';

class CustomEditBottomShet extends StatelessWidget {
  final BuildContext context;
  const CustomEditBottomShet({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CategoriesController>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.grey200!.withOpacity(0.5),
      ),
      width: double.infinity,
      height: double.infinity,
      // ignore: deprecated_member_use

      child: IconButton(
        icon: Icon(Icons.edit, color: AppColor.grey),
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.grey200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          initialValue: 'title',
                          decoration: InputDecoration(
                            labelText: 'Category Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          initialValue: 'title',
                          decoration: InputDecoration(
                            labelText: 'Category Name Ar',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          initialValue: 'title',
                          decoration: InputDecoration(
                            labelText: 'Category description',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          initialValue: 'title',
                          decoration: InputDecoration(
                            labelText: 'Category image',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            controller.toEditMode();
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.done, size: 20),
                          label: Text('Done Editing'),
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
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
