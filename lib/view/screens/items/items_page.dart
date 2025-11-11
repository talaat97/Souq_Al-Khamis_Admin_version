import 'package:flutter/material.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
