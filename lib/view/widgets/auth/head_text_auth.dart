import 'package:flutter/material.dart';

class HeadLineAuth extends StatelessWidget {
  final String text;
  const HeadLineAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
