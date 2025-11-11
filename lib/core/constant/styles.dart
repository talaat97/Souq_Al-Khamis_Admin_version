import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/core/constant/font_wight_helper.dart';

class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: AppColor.black,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeightHelper.bold,
    color: AppColor.primaryColor,
  );

  static TextStyle font13BlueSemiBold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.secondaryColor,
  );

  static TextStyle font13DarkBlueMedium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.secondaryColor,
  );

  static TextStyle font13DarkBlueRegular = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.secondaryColor,
  );

  static TextStyle font24BlueBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: AppColor.primaryColor,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.white,
  );

  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.grey,
  );

  static TextStyle font12GrayRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.grey,
  );

  static TextStyle font12GrayMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.grey,
  );

  static TextStyle font12DarkBlueRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.secondaryColor,
  );

  static TextStyle font12BlueRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.primaryColor,
  );

  static TextStyle font13BlueRegular = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.primaryColor,
  );

  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.grey,
  );

  static TextStyle font14LightGrayRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.grey,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.secondaryColor,
  );

  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.white,
  );

  static TextStyle font14BlueSemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.primaryColor,
  );

  static TextStyle font15DarkBlueMedium = TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.secondaryColor,
  );

  static TextStyle font18DarkBlueBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.bold,
    color: AppColor.secondaryColor,
  );

  static TextStyle font18DarkBlueSemiBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.secondaryColor,
  );

  static TextStyle font18WhiteMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.white,
  );

  static TextStyle font14DarkBlueBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.bold,
    color: AppColor.secondaryColor,
  );
}

/// ---------------------------------------------------------------------------
/// 🎨 Modern Dashboard Background Widget
/// ---------------------------------------------------------------------------

/// 🌄 Modern eCommerce Dashboard Background
class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColor.backgroundColor, // soft base
            AppColor.surfaceColor, // gentle contrast tone
          ],
        ),
      ),
      child: Stack(
        children: [
          // 🔸 subtle orange glow at top-right
          Positioned(
            top: -100,
            right: -60,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColor.primaryColor.withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // 🟠 subtle gold accent bottom-left
          Positioned(
            bottom: -80,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColor.tertiaryColor.withOpacity(0.12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // 🟤 warm brown tint in the background center
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColor.secondaryColor.withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // 👇 main content
          child,
        ],
      ),
    );
  }
}
