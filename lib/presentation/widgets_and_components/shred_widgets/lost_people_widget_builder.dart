import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../../domain/entities/lost_person_data_entity.dart';

class LostPeopleWidgetBuilder extends StatelessWidget {
  final TextDirection textDirection;
  final LostPersonDataEntity lostPersonDataEntity;

  const LostPeopleWidgetBuilder(
      {Key? key,
      required this.textDirection,
      required this.lostPersonDataEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: Row(
        children: [
          Hero(
            tag: lostPersonDataEntity.id!,
            child: Container(
              width: 182.w,
              height: 162.h,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2.w, 4.h),
                    blurRadius: 6.r,
                    color: Colors.black.withOpacity(0.25),
                  )
                ],
              ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: lostPersonDataEntity.url!,
                placeholder: (context, url) => Shimmer.fromColors(
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
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lostPersonDataEntity.name!,
                  style: TextStyle(
                    color: AppColors.blueTextColor,
                    fontFamily: FontsPath.sukarBlack,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  lostPersonDataEntity.city!,
                  style: TextStyle(
                    color: AppColors.blueTextColor,
                    fontFamily: FontsPath.sukarBlack,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              Jiffy(lostPersonDataEntity.dateAdded!).yMMMd,
              style: TextStyle(
                color: AppColors.blueTextColor,
                fontFamily: FontsPath.sukarBlack,
                fontSize: 12.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}