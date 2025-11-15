import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:souq_al_khamis_admin_version/view/screens/items/dummy_data.dart';
import '../../../controller/items/view.dart';
import '../../../core/constant/colors.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ItemsViewController());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          itemCount: dummyItems.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = dummyItems[index];
            return Card(
              color: const Color(0xFFFFEEE0), // SAME AS CATEGORY PAGE
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              child: InkWell(
                onTap: () {
                  debugPrint("Tapped ${item['name']}");
                },
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // IMAGE WRAPPER
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            item['icon'],
                            height: 45,
                            colorFilter: const ColorFilter.mode(
                              AppColor.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // MAIN DETAILS
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // NAME
                            Text(
                              item['name'],
                              style: const TextStyle(
                                color: AppColor.textPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            const SizedBox(height: 6),

                            // DESCRIPTION
                            Text(
                              item['desc'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColor.textSecondary,
                                fontSize: 13,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // STATUS + COUNT
                            Row(
                              children: [
                                // AVAILABILITY BADGE
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: item['available']
                                        ? AppColor.greenColor.withOpacity(0.15)
                                        : AppColor.redColor.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    item['available']
                                        ? "Available"
                                        : "Out of stock",
                                    style: TextStyle(
                                      color: item['available']
                                          ? AppColor.green2Color
                                          : AppColor.redColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 12),

                                // COUNT
                                Text(
                                  "Count: ${item['count']}",
                                  style: const TextStyle(
                                    color: AppColor.textSecondary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      // ACTION ICONS
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit,
                                color: AppColor.secondaryColor),
                            onPressed: () {
                              debugPrint("Edit ${item['name']}");
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete,
                                color: AppColor.redColor),
                            onPressed: () {
                              debugPrint("Delete ${item['name']}");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // Replace FAB with PopupMenuButton
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.goToAddItemPage();
          },
          child: Icon(Icons.add)),
    );
  }
}
