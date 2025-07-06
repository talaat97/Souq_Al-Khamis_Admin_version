import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/handling_data.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/static/model/item_model.dart';

import '../../../controller/items/items_controller.dart';
import '../../widgets/items/addItemButton.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemController());

    return GetBuilder<ItemController>(
      builder: (itemsController) => HandlingDataView(
        statusRequest: itemsController.statusRequest,
        widget: DefaultTabController(
          length: itemsController.categories.length, // عدد التابات
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColor.white, // لون خلفية شريط العنوان
              title: Text('الاصنــــــــاف'),
              bottom: TabBar(
                labelColor: AppColor.primaryColor, // لون النص للتاب المحدد
                unselectedLabelColor: Colors.grey, // لون النص للتاب غير المحدد
                isScrollable: true,
                // يسمح بالتمرير إذا كان عدد التابات كبيرًا
                indicatorColor:
                    AppColor.primaryColor, // لون الخط السفلي للتاب المحدد
                tabs: List<Widget>.generate(
                  itemsController.categories.length,
                  (index) => InkWell(
                    onTap: () {
                      // هنا يمكنك إضافة وظيفة عند الضغط على التاب
                      itemsController.getItemsByCategory(
                          itemsController.categories[index].categoriesId);
                    },
                    child: Tab(
                      text: itemsController.categories[index].categoriesNameAr,
                    ),
                  ),
                ).toList(),
              ),
            ),
            body: TabBarView(
              children: List<Widget>.generate(
                itemsController.categories.length,
                (categoryIndex) {
                  return ListView.builder(
                    itemCount: itemsController.items.length,
                    itemBuilder: (context, itemIndex) {
                      ItemModel item = itemsController.items[itemIndex];
                      return Card(
                        child: ListTile(
                          title: Text(item.iteamsNameAr!),
                          subtitle: Text(item.iteamsDecAr!),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              showDeleteConfirmationDialog(context);
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: AddItemButton(
              onPressed: () {
                itemsController.goToAddItemPage();
                // هنا يمكنك إضافة وظيفة الزر العائم
                print('زر عائم تم الضغط عليه');
              },
              title: 'إضافة عنصر',
              colorButton: AppColor.primaryColor,
              icon: Icons.add,
            ),
          ),
        ),
      ),
    );
  }
}

void showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'تنبيه',
          textDirection: TextDirection.rtl,
        ),
        content: Text(
          'هل أنت متأكد أنك تريد حذف هذا العنصر؟',
          textDirection: TextDirection.rtl,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // إغلاق النافذة بدون حذف
            },
            child: Text(
              'إلغاء',
              textDirection: TextDirection.rtl,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // تنفيذ الحذف هنا
              Navigator.of(context).pop(); // إغلاق النافذة بعد الحذف
              // يمكنك عرض SnackBar أو تحديث الحالة هنا
            },
            child: Text(
              'نعم، احذف',
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      );
    },
  );
}
