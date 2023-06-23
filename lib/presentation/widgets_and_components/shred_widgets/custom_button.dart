import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/theme/app_colors_light_theme.dart';

import '../../../core/assets_path/fonts_path.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final Function isTapped;
  final double? height;
  final double? fontSize;
  final double width;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final Color? buttonColor;
  final Color? buttonOverLayColor;
  final Color textColor;

  const CustomButton(
      {Key? key,
        required this.buttonTitle,
        required this.isTapped,
        required this.width,
        this.height,
        this.paddingVertical ,
        this.paddingHorizontal,
        this.buttonColor,
        this.textColor = Colors.white,
        this.fontSize,
        this.buttonOverLayColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: AppColors.whitTextColor,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r), // <-- Radius
          ),
          padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal??45.w, vertical: paddingVertical??16.h),
        ),
        onPressed: () {
          isTapped();
        },
        child: Center(
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontFamily: FontsPath.sukarBold,
              fontSize: fontSize ?? 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}