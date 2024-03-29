import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';

class AuthTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String firstTitle;
  final String secondTitle;
  const AuthTextButton({Key? key, this.onPressed, required this.firstTitle, required this.secondTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          text: '$firstTitle  ',
          children: [
            TextSpan(
              text: secondTitle,
              style: TextStyle(
                color: AppColors.blueTextColor,
                fontFamily: FontsPath.sukarBold,
                fontSize: 16.sp,
              ),
            )
          ],
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontFamily: FontsPath.sukarBlack,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}
