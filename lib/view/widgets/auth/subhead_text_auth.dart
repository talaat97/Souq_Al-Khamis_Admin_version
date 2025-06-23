import 'package:flutter/material.dart';

class SubHeadText extends StatelessWidget {
  final String text;
  const SubHeadText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
