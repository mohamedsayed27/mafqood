import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';

class LogoText extends StatelessWidget {
  const LogoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'مفقود',
        style: TextStyle(
          color: AppColorsLightTheme.blueTextColor,
          fontFamily: FontsPath.sukarBold,
          fontSize: 64.sp,
        ),
      ),
    );
  }
}
