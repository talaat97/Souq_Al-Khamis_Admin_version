import 'package:flutter/widgets.dart';

import '../../../core/constant/colors.dart';

class DetailsTextTableStyle extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  const DetailsTextTableStyle({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color ?? AppColor.primaryColor, fontSize: fontSize ?? 20),
    );
  }
}
