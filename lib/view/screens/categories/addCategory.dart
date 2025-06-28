import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:souq_al_khamis_admin_version/controller/categories/view_categories_contollre.dart'
    show CategoriesController;

import '../../../core/constant/colors.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    var categoriesController = Get.find<CategoriesController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: Form(
        key: categoriesController.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  Navigator.pop(context);
                },
                icon: Icon(Icons.done, size: 20),
                label: Text('Add Category'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
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
  }
}
