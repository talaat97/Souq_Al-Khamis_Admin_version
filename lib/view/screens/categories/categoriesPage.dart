import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/view/widgets/categories/cardCategories.dart';

int numCategories = 2;

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        title: const Text('Categories'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          // Add space for larger screens
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 500
                  ? numCategories = 4
                  : numCategories = 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
            ),
            children: [
              CardCategories(
                  title: 'Chosse',
                  itemNumber: 5,
                  imageUrl: 'assets/image/default_category.png'),
              CardCategories(
                  title: 'bakery',
                  itemNumber: 2,
                  imageUrl: 'assets/image/default_category.png'),
              CardCategories(
                  title: 'ball',
                  itemNumber: 15,
                  imageUrl: 'assets/image/default_category.png'),
              CardCategories(
                  title: 'galsses',
                  itemNumber: 1,
                  imageUrl: 'assets/image/default_category.png'),
              CardCategories(
                  title: 'phones',
                  itemNumber: 3,
                  imageUrl: 'assets/image/default_category.png'),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to add a new category
        },
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
