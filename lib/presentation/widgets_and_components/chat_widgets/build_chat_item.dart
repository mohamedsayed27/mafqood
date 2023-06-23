import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/assets_path/fonts_path.dart';

class BuildChatItem extends StatelessWidget {
  final String image;
  final String name;
  final String text;
  final String dateTime;
  const BuildChatItem({Key? key, required this.image, required this.name, required this.text, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 11.h),
        height: 75.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 16.r,
                color: Colors.black.withOpacity(0.14))
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 52.h,
              width: 48.w,
              clipBehavior: Clip.antiAlias,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
              child:CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                image,
                placeholder: (context, url) =>
                    Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[300]!,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: const Color(0xff3C475C),
                        fontFamily: FontsPath.sukarBold,
                        fontSize: 13.sp),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: const Color(0xff939FB5),
                        fontFamily: FontsPath.sukarRegular,
                        fontSize: 13.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              Jiffy(dateTime).Hm,
              style: TextStyle(
                  color: const Color(0xff939FB5),
                  fontFamily: FontsPath.sukarRegular,
                  fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }
}
