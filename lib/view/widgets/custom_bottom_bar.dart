import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/bottomNavBar.dart';
import '../../core/constant/colors.dart';

class CustomButtonbar extends GetView {
  const CustomButtonbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarControllerImp>(
      builder: (pageController) => BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        color: AppColor.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
              pageController.listPage.length,
              (index) => OneButtonAppBar(
                pageName: pageController.titlePage[index]['title'],
                pageIcon: pageController.titlePage[index]['icon'],
                onPressed: () {
                  pageController.changePage(index);
                },
                active: pageController.currentPage == index ? true : false,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OneButtonAppBar extends StatelessWidget {
  final String pageName;
  final IconData pageIcon;
  bool? active;
  final void Function() onPressed;
  OneButtonAppBar({
    super.key,
    required this.pageName,
    required this.pageIcon,
    required this.onPressed,
    this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(pageIcon,
              size: active == true ? 35 : 25,
              color: active == true ? AppColor.primaryColor : AppColor.grey),
          Text(
            pageName,
            style: TextStyle(
                color: active == true ? AppColor.primaryColor : AppColor.grey),
          ),
        ],
      ),
    );
  }
}
