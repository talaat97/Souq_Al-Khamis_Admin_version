import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/view/widgets/categories/CustomEditBottomShet.dart';

import '../../../controller/categories/categories_contollre.dart';

class CardCategories extends StatelessWidget {
  final String title;
  final int itemNumber;
  final String imageUrl;
  final void Function()? navigateTo;
  const CardCategories(
      {super.key,
      required this.title,
      required this.itemNumber,
      required this.imageUrl,
      this.navigateTo});

  @override
  Widget build(BuildContext ctx) {
    Get.put(CategoriesController());
    return GetBuilder<CategoriesController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color:
                    itemNumber != 0 ? AppColor.secondColor : AppColor.redColor,
                child: Column(
                  children: [
                    Flexible(
                      child: SvgPicture.asset(
                        imageUrl,
                        width: double.infinity,
                        placeholderBuilder: (BuildContext context) => Container(
                          width: double.infinity,
                          height: 100,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Category: $title',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white,
                          ),
                        ),
                        Text(
                          'Number of items: ${itemNumber == 0 ? '0' : itemNumber}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (controller.modeEdit) 
              CustomEditBottomShet(context: ctx),
            ],
          ),
        );
      },
    );
  }
}
