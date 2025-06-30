import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

import '../../../controller/items/items_controller.dart';
import '../../widgets/items/addItemButton.dart';

final List<String> categories = [
  'هواتف',
  'عجلات',
  'تصنيف 3',
  'تصنيف 4',
  'تصنيف 5',
  'تصنيف 6',
  'تصنيف 7',
  'تصنيف 8',
];

final Map<String, List<String>> items = {
  'هواتف': [
    'ايفون اكس 9',
    'شاحن سريع',
    'ساعة ذكية',
    'سماعة بلوتوث',
    'هاتف سامسونج جالاكسي S21',
    'هاتف هواوي P40',
    'ايفون اكس 9',
    'شاحن سريع',
    'ساعة ذكية',
    'سماعة بلوتوث',
    'هاتف سامسونج جالاكسي S21',
    'هاتف هواوي P40',
  ],
  'عجلات': [
    'عنصر 2-1',
    'عنصر 2-2',
    'عنصر 2-3',
    'عنصر 2-4',
    'عنصر 2-5',
    'عنصر 2-6',
    'عنصر 2-7',
    'عنصر 2-8'
  ],
  'تصنيف 3': ['عنصر 3-1', 'عنصر 3-2', 'عنصر 3-3', 'عنصر 3-4'],
};

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ItemController());
    return DefaultTabController(
      length: categories.length, // عدد التابات
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
            tabs: categories
                .map((category) => Tab(
                        child: Text(
                      category,
                    )))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: categories.map((category) {
            List<String> currentItems = items[category] ?? [];
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: currentItems.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColor.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: ListTile(
                          isThreeLine: true,
                          selectedTileColor:
                              const Color.fromARGB(255, 251, 236, 187),
                          title: Text(
                            textDirection: TextDirection.rtl,
                            currentItems[index],
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          subtitle: Text(
                            textDirection: TextDirection.rtl,
                            ' وصف قصير للعنصر هذا الذي هو جزء من التصنيف $category سيمثل هنا. ببساطة',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.delete,
                                    color: AppColor.redColor),
                                onPressed: () {
                                  showDeleteConfirmationDialog(context);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.edit,
                                    color: AppColor.primaryColor),
                                onPressed: () {
                                  // هنا يمكنك إضافة وظيفة زر التعديل
                                  print('تعديل العنصر: ${currentItems[index]}');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/image/product.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AddItemButton(
          onPressed: () {
            controller.goToAddItemPage();
            // هنا يمكنك إضافة وظيفة الزر العائم
            print('زر عائم تم الضغط عليه');
          },
          title: 'إضافة عنصر',
          colorButton: AppColor.primaryColor,
          icon: Icons.add,
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
