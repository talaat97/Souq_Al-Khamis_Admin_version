import 'package:flutter/material.dart';


import '../../../core/constant/colors.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Form(
      
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
