import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';

class MyMessageItem extends StatelessWidget {
  final String message;
  final String time;
  const MyMessageItem({Key? key, required this.message, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 200.w,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColorsLightTheme.primaryColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontFamily: FontsPath.sukarRegular
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(time, style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontFamily: FontsPath.sukarRegular
                ),),
                SizedBox(
                  width: 5.h,
                ),
                // Icon(Icons.done_all,color: Colors.blue,size: 20.r,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
