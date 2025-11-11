import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items/items_controller.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Items Page'),
      ),
      body: Center(
        child: Text('Items Page '),
      ),
    );
  }
}
