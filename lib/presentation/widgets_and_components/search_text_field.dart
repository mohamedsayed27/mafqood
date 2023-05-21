import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mafqood/core/theme/app_colors_light_theme.dart';

import '../../core/assets_path/fonts_path.dart';
import '../../core/assets_path/svg_path.dart';

class SearchTextField extends StatelessWidget {
  final void Function()? onCameraClicked;
  const SearchTextField({Key? key, this.onCameraClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(10.r),
        bottomRight: Radius.circular(10.r),
      ),
      borderSide: const BorderSide(
        color: AppColorsLightTheme.greySeacrTextFilledColor,
      ),
    );
    return SizedBox(
      height: 45.h,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(
                color: AppColorsLightTheme.whitColor,
                fontSize: 14.sp,
                fontFamily: FontsPath.sukarRegular,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "بحث بالأسم",
                filled: true,
                fillColor: AppColorsLightTheme.greySeacrTextFilledColor,
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                hintStyle: TextStyle(
                  color: AppColorsLightTheme.whitColor,
                  fontSize: 12.sp,
                  fontFamily: FontsPath.sukarRegular,
                ),
                prefixIcon: Padding(
                  padding:  const EdgeInsets.all(9.0),
                  child: SvgPicture.asset(
                    SvgPath.searchIcon,
                    width: 16.w,
                    height: 16.h,
                    colorFilter: const ColorFilter.mode(
                      AppColorsLightTheme.whitColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 45.h,
            width: 47.w,
            decoration: BoxDecoration(
              color: AppColorsLightTheme.bottomNavBarGreyIconColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
            ),
            child: InkWell(
              onTap: onCameraClicked,
              child: Center(
                child: Icon(
                  Icons.camera_alt,
                  color: AppColorsLightTheme.greySeacrTextFilledColor,
                  size: 26.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
