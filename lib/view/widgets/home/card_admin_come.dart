import 'package:flutter/material.dart';

class CardAdminHome extends StatelessWidget {
  final String title;
  final String imageUrl;
  const CardAdminHome({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Flexible(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
