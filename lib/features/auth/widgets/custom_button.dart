
import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomButtonInLogeIn extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const CustomButtonInLogeIn(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      color: AppColor.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(color:Colors.white ),
      ),
    );
  }
}
