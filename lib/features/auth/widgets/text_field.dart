import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController myController;
  final IconData myIcon;
  final String? Function(String? val)? valid;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.myController,
      required this.myIcon,
      required this.valid,
      this.keyboardType,
      this.obscureText,
      this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      obscureText: obscureText == null || obscureText == false ? false : true,
      keyboardType: keyboardType,
      validator: valid,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: onTapIcon,
          child: Icon(myIcon),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        hintText: hintText,
        label: Text(labelText),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }
}
