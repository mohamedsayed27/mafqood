import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/assets_path/fonts_path.dart';

import '../../../core/theme/app_colors_light_theme.dart';

class CustomSimpleDialogOption extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomSimpleDialogOption({Key? key, required this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      padding: const EdgeInsets.all(20),
      onPressed: onPressed,
      child: Text(title,style: TextStyle(fontSize: 14.sp,color: AppColorsLightTheme.greyTextColor,fontFamily: FontsPath.sukarBlack)),
    );
  }
}
