import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';

class AnotherPersonMessageItem extends StatelessWidget {
  final String message;
  final String time;

  const AnotherPersonMessageItem(
      {Key? key, required this.message, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        width: 209.w,
        height: 70.h,
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
            color: AppColorsLightTheme.greyColorContainers,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontFamily: FontsPath.sukarRegular),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  time,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontFamily: FontsPath.sukarRegular),
                ),
                SizedBox(
                  width: 5.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
