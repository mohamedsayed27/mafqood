import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';

class AuthTextFormField extends StatelessWidget {
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

  const AuthTextFormField({
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
            color: AppColorsLightTheme.authTextFieldFillColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(
            color: AppColorsLightTheme.authTextFieldFillColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(
            color: AppColorsLightTheme.authTextFieldFillColor,
          ),
        ),
        filled: true,
        fillColor: AppColorsLightTheme.authTextFieldFillColor,
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
            fontFamily: FontsPath.sukarRegular),
        suffixIcon: suffix,
        prefixIcon: prefix,
        contentPadding: EdgeInsets.all(20.r),
      ),
    );
  }
}
