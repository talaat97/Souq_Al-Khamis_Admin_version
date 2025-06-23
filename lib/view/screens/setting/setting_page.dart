import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/core/constant/image_assets.dart';

import '../../../controller/settings/settings_contoller.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsContoller());
    return Container(
      color: AppColor.secondColor,
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor.white,
              ),
              Positioned(
                  top: Get.width / 6,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: const CircleAvatar(
                      radius: 90,
                      backgroundColor: AppColor.primaryColor,
                      backgroundImage: AssetImage(AppImageAsset.deliveryLogo),
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 150),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: AppColor.white,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    '50'.tr,
                    style: const TextStyle(color: AppColor.grey),
                  ),
                  trailing: GetBuilder<SettingsContoller>(
                    builder: (controller) => Switch(
                      activeColor: AppColor.grey,
                      value: controller.notifactionSwitch,
                      onChanged: (value) {
                        controller.notifactionSwitch = value;
                        controller.diableNotification();
                      },
                    ),
                  ),
                ),
                const Divider(),
                TextInCardSeetting(
                    title: '53'.tr,
                    onTap: () {
                      controller.phoneCall();
                    },
                    icon: Icons.phone),
                const Divider(),
                TextInCardSeetting(
                    title: '55'.tr,
                    onTap: () {
                      controller.changeLang();
                    },
                    icon: Icons.language),
                const Divider(),
                TextInCardSeetting(
                    title: '54'.tr,
                    onTap: () {
                      controller.logOut();
                    },
                    icon: Icons.logout_outlined),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextInCardSeetting extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final IconData icon;
  const TextInCardSeetting({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: AppColor.grey),
      ),
      onTap: onTap,
      trailing: Icon(
        icon,
        color: AppColor.grey,
        size: 30,
      ),
    );
  }
}
