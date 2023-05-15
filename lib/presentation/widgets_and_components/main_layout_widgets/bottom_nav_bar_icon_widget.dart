import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';

class BottomNavBarIcon extends StatelessWidget {
  final String label;
  final String iconPath;
  final void Function() onTap;
  final int currentIndex;
  final int index;
  final double? iconWidth;
  final double? iconHeight;

  const BottomNavBarIcon({
    Key? key,
    required this.label,
    required this.iconPath,
    required this.onTap,
    required this.currentIndex,
    required this.index,
    this.iconWidth,
    this.iconHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        side: const BorderSide(color: Colors.transparent),
        foregroundColor: Colors.white60,
        backgroundColor: AppColorsLightTheme.primaryColor,
        shape: const CircleBorder(),
      ),
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: iconWidth ?? 28.w,
            height: iconHeight ?? 28.h,
            colorFilter: ColorFilter.mode(
              currentIndex == index
                  ? AppColorsLightTheme.whitTextColor
                  : AppColorsLightTheme.bottomNavBarGreyIconColor,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              fontFamily: FontsPath.sukarBold,
              color: currentIndex == index
                  ? AppColorsLightTheme.whitTextColor
                  : AppColorsLightTheme.bottomNavBarGreyIconColor,
            ),
          )
        ],
      ),
    );
  }
}
