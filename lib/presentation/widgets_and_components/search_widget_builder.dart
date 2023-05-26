import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/assets_path/fonts_path.dart';
import '../../core/theme/app_colors_light_theme.dart';

class SearchWidgetBuilder extends StatelessWidget {
  final TextDirection textDirection;
  const SearchWidgetBuilder({Key? key, required this.textDirection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: Row(
        children: [
          Container(
            width: 182.w,
            height: 162.h,
            decoration: BoxDecoration(
              color: AppColorsLightTheme.greySeacrTextFilledColor,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2.w, 4.h),
                  blurRadius: 6.r,
                  color: Colors.black.withOpacity(0.25),
                )
              ],
            ),
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اسم التائه',
                  style: TextStyle(
                    color: AppColorsLightTheme.blueTextColor,
                    fontFamily: FontsPath.sukarBlack,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 20.h,),
                Text(
                  'موقع التائه',
                  style: TextStyle(
                    color: AppColorsLightTheme.blueTextColor,
                    fontFamily: FontsPath.sukarBlack,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Align(alignment: Alignment.bottomCenter,child: Text(
            'منذ00:00',
            style: TextStyle(
              color: AppColorsLightTheme.blueTextColor,
              fontFamily: FontsPath.sukarBlack,
              fontSize: 12.sp,
            ),
          ),)
        ],
      ),
    );
  }
}
