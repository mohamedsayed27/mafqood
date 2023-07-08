import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mafqood/core/theme/app_colors_light_theme.dart';

import '../../core/assets_path/fonts_path.dart';
import '../../core/assets_path/svg_path.dart';

class SearchTextField extends StatelessWidget {
  final void Function()? onCameraClicked;
  final void Function()? onSearchPressed;
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  final void Function(String?)? onChanged;

  const SearchTextField({
    Key? key,
    this.onCameraClicked,
    this.onSearchPressed,
    this.controller,
    this.onSubmitted,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(10.r),
        bottomRight: Radius.circular(10.r),
      ),
      borderSide: const BorderSide(
        color: AppColors.greySearchTextFilledColor,
      ),
    );
    return SizedBox(
      height: 45.h,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(
                color: AppColors.whitColor,
                fontSize: 14.sp,
                fontFamily: FontsPath.sukarRegular,
              ),
              onSubmitted: onSubmitted,
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "بحث بالأسم",
                filled: true,
                fillColor: AppColors.greySearchTextFilledColor,
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                hintStyle: TextStyle(
                  color: AppColors.whitColor,
                  fontSize: 12.sp,
                  fontFamily: FontsPath.sukarRegular,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: InkWell(
                    onTap: onSearchPressed,
                    child: SvgPicture.asset(
                      SvgPath.searchIcon,
                      width: 16.w,
                      height: 16.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.whitColor,
                        BlendMode.srcIn,
                      ),
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
              color: AppColors.bottomNavBarGreyIconColor,
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
                  color: AppColors.greySearchTextFilledColor,
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
