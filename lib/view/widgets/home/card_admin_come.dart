import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart'
    show AppColor;

class CardAdminHome extends StatelessWidget {
  final String title;
  final String imageUrl;
  final void Function()? navigartTo;
  const CardAdminHome(
      {super.key,
      required this.title,
      required this.imageUrl,
      this.navigartTo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigartTo,
      child: Card(
        elevation: 5,
        color: Color(0xFFFFEEE0),
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
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
