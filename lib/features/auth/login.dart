import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/controller/auth/login_controller.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/core/function/alert.dart';
import 'package:souq_al_khamis_admin_version/core/function/valild.dart';
import 'package:souq_al_khamis_admin_version/features/auth/widgets/custom_button.dart';
import 'package:souq_al_khamis_admin_version/features/auth/widgets/head_text_auth.dart';
import 'package:souq_al_khamis_admin_version/features/auth/widgets/logo_auth.dart';
import 'package:souq_al_khamis_admin_version/features/auth/widgets/subhead_text_auth.dart';
import 'package:souq_al_khamis_admin_version/features/auth/widgets/text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LogeinControllerImp controller = Get.put(LogeinControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sign In',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
          onWillPop: exitAlert,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Form(
              key: controller.formkey,
              child: ListView(
                children: [
                  const LogoAuth(),
                  HeadLineAuth(
                    text: '10'.tr,
                  ),
                  SubHeadText(text: '11'.tr),
                  const SizedBox(height: 30),
                  CustomTextField(
                    valid: (val) {
                      return checkVaild(val!, 5, 100, 'email');
                    },
                    labelText: "18".tr,
                    hintText: '12'.tr,
                    myIcon: Icons.email_outlined,
                    myController: controller.email,
                  ),
                  const SizedBox(height: 20),
                  GetBuilder<LogeinControllerImp>(
                    builder: (controller) => CustomTextField(
                      obscureText: controller.isShowPassword,
                      onTapIcon: () {
                        controller.showPassword();
                      },
                      valid: (val) {
                        return checkVaild(val!, 5, 30, 'password');
                      },
                      labelText: "19".tr,
                      hintText: '13'.tr,
                      myIcon: Icons.password_outlined,
                      myController: controller.password,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButtonInLogeIn(
                    text: '15'.tr,
                    onTap: () {
                      controller.login();
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )),
    );
  }
}
