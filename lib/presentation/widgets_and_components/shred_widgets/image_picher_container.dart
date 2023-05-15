import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/theme/app_colors_light_theme.dart';

import '../../../core/assets_path/fonts_path.dart';

class ImagePickerContainer extends StatelessWidget {
  const ImagePickerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 214.w,
      height: 190.h,
      decoration: BoxDecoration(
        color: AppColorsLightTheme.authTextFieldFillColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
              offset: Offset(2.w, 4.h),
              blurRadius: 6.r,
              color: Colors.black.withOpacity(0.25),)
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt,
                  color: AppColorsLightTheme.bottomNavBarGreyIconColor,
                  size: 55.r,
                ),
                Text(
                  'افتح الكاميرا',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: FontsPath.sukarBold,
                    color: AppColorsLightTheme.bottomNavBarGreyIconColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50.h,
            width: 214.w,
            decoration: BoxDecoration(
              color: AppColorsLightTheme.bottomNavBarGreyIconColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: Center(
              child: Text(
                'اضف صوره من المعرض',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: FontsPath.sukarBold,
                  color: AppColorsLightTheme.whitTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
