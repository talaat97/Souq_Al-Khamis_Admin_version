import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/controller/categories/view_categories_contollre.dart'
    show CategoriesController;

import '../../../controller/items/items_controller.dart';
import '../../../core/constant/colors.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    var itemController = Get.find<ItemController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Form(
        key: itemController.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                initialValue: 'title',
                decoration: InputDecoration(
                  labelText: 'Item Name',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                initialValue: 'title',
                decoration: InputDecoration(
                  labelText: 'Item Name Ar',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                initialValue: 'title',
                decoration: InputDecoration(
                  labelText: 'Item description',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                initialValue: 'title',
                decoration: InputDecoration(
                  labelText: 'Item image',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.done, size: 20),
                label: Text('Add Item'),
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
