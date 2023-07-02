import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../../domain/entities/lost_person_data_entity.dart';

class LostPeopleWidgetBuilder extends StatelessWidget {
  final TextDirection containerDirection;
  final AlignmentGeometry dateDirection;
  final LostPersonDataEntity lostPersonDataEntity;

  const LostPeopleWidgetBuilder(
      {Key? key,
      required this.containerDirection,
      required this.lostPersonDataEntity, required this.dateDirection,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: containerDirection,
      child: SizedBox(
        height: 162.h,
        width: double.infinity,
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
                  SizedBox(
                    height: 10.h,
                  ),
                  Hero(
                    tag: "${lostPersonDataEntity.id!}name",
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        lostPersonDataEntity.name!,
                        style: TextStyle(
                          color: AppColors.blueTextColor,
                          fontFamily: FontsPath.sukarBlack,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: Hero(
                      tag: "${lostPersonDataEntity.id}city",
                      child: Material(
                        type:
                        MaterialType.transparency,
                        child: Text(
                          "${lostPersonDataEntity.city!} : ${lostPersonDataEntity.area!}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color:
                            AppColors.bottomNavBarGreyIconColor,
                            fontFamily: FontsPath.sukarBold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: dateDirection,
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
            ),
          ],
        ),
      ),
    );
  }
}
