import 'package:flutter/material.dart';

class CustomCategoryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Color colorButton;
  final IconData icon;
  const CustomCategoryButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.colorButton,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        backgroundColor: colorButton,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
