import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/global/theme/app_colors_light_theme.dart';

import '../../../core/global/assets_path/fonts_path.dart';

class CustomBoardingButton extends StatelessWidget {
  final bool isLast;
  final Function isLastTap;
  final Function isTapped;

  const CustomBoardingButton({
    Key? key,
    required this.isLast,
    required this.isLastTap,
    required this.isTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: !isLast ? const CircleBorder() : const StadiumBorder(),
        backgroundColor: AppColorsLightTheme.whitTextColor,
        foregroundColor: AppColorsLightTheme.primaryColor,
        padding: !isLast
            ? EdgeInsets.all(16.r)
            : EdgeInsets.symmetric(horizontal: 45.w, vertical: 16.h),
      ),
      onPressed: () {
        if (!isLast) isTapped();
        if (isLast) isLastTap();
      },
      child: !isLast
          ? Center(
              child: Icon(
                Icons.arrow_forward,
                color: AppColorsLightTheme.primaryColor,
                size: 32.r,
              ),
            )
          : Text(
              'ابدأ الأن',
              style: TextStyle(
                color: AppColorsLightTheme.blueTextColor,
                fontFamily: FontsPath.sukarBlack,
                fontSize: 15.sp,
              ),
            ),
    );
  }
}
