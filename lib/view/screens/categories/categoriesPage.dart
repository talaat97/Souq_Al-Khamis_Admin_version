import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/controller/categories/categories_contollre.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/view/widgets/categories/CustomFAButton.dart';
import 'package:souq_al_khamis_admin_version/view/widgets/categories/cardCategories.dart';

//TODO: just for test delete it when i link with backend
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
          GridView.builder(
            itemCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 500
                  ? numCategories = 4
                  : numCategories = 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index) {
              return CardCategories(
                title: 'Category $index',
                itemNumber: index,
                imageUrl: 'assets/svg/shose.svg',
                navigateTo: () {
                  // Navigate to details page
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: CustomFAButtons(),
    );
  }
}
