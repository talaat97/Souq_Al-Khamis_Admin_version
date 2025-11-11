import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/constant/image_assets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.loginImage);
  }
}
