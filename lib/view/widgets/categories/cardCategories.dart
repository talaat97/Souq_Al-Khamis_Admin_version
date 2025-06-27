import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: itemNumber != 0 ? AppColor.secondColor : AppColor.redColor,
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
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

                    // إذا في نصوص كثيرة، ضع Scroll
                    // Or use Flexible inside here if needed.
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
