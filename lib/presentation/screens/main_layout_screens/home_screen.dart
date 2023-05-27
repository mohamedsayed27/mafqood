import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/assets_path/images_path.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          const LogoText(),
          Text(
            'مرحباً . . .',
            style: TextStyle(
              color: AppColorsLightTheme.blueTextColor,
              fontFamily: FontsPath.sukarBlack,
              fontSize: 24.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
            style: TextStyle(
              color: AppColorsLightTheme.bottomNavBarGreyIconColor,
              fontFamily: FontsPath.sukarBold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'تتفاصيل التطبيق',
            style: TextStyle(
              color: AppColorsLightTheme.blueTextColor,
              fontFamily: FontsPath.sukarBlack,
              fontSize: 24.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
                  style: TextStyle(
                    color: AppColorsLightTheme.bottomNavBarGreyIconColor,
                    fontFamily: FontsPath.sukarBold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 20.h,
              ),
              Image.asset(
                ImagesPath.chart,
                width: 182.w,
                height: 155.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}
