import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final void Function()? onTap;
  final Widget? suffix;
  final Widget? prefix;
  final bool isPassword;
  final bool? isEnable;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int maxLength;
  final bool readOnly;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.validate,
    this.suffix,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength = 100,
    this.prefix,
    this.isPassword = false, this.isEnable, this.onTap, this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnable,
      maxLength: maxLength,
      readOnly: readOnly,
      onTap: onTap,
      keyboardType: keyboardType,
      controller: controller,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        counter: const SizedBox.shrink(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(
            color: AppColors.authTextFieldFillColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(
            color: AppColors.authTextFieldFillColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(
            color: AppColors.authTextFieldFillColor,
          ),
        ),
        filled: true,
        fillColor: AppColors.authTextFieldFillColor,
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppColors.bottomNavBarGreyIconColor,
            fontSize: 14.sp,
            fontFamily: FontsPath.sukarRegular),
        suffixIcon: suffix,
        prefixIcon: prefix,
        contentPadding: EdgeInsets.all(20.r),
      ),
    );
  }
}
