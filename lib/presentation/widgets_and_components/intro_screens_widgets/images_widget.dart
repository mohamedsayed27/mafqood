import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/global/theme/app_colors_light_theme.dart';
import '../../../core/global/assets_path/fonts_path.dart';
import 'onboarding_class.dart';

class ImagesWidget extends StatelessWidget {
  final OnboardingModel model;
  const ImagesWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(model.backGround,fit: BoxFit.cover,),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black.withOpacity(0.5),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 55.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Text(
                model.title,
                style: TextStyle(
                    fontSize: 24.sp,
                    color: AppColorsLightTheme.whitTextColor,
                    fontFamily: FontsPath.sukarBlack,),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                model.bodyTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColorsLightTheme.whitTextColor,
                    height: 1.5.h,
                    fontFamily: FontsPath.sukarBold,),
              ),
            ],
          ),
        )
      ],
    );
  }
}
