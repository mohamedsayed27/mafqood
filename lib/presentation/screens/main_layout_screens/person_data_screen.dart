import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/domain/entities/lost_person_data_entity.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/shred_widgets/arrow_back_button.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';

class PersonDataScreen extends StatelessWidget {
  final LostPersonDataEntity lostPersonDataEntity;
  const PersonDataScreen({Key? key, required this.lostPersonDataEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 50.h,
          ),
          const LogoText(),
          const ArrowBackButton(),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 57.w),
            child: Hero(
              tag: lostPersonDataEntity.id!,
              child: Container(
                width: double.infinity,
                height:
                279.97.h,
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
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'اسم التائه',
            style: TextStyle(
              color: AppColorsLightTheme.blueTextColor,
              fontFamily: FontsPath.sukarBlack,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            lostPersonDataEntity.name!,
            style: TextStyle(
              color:
              AppColorsLightTheme.bottomNavBarGreyIconColor,
              fontFamily: FontsPath.sukarBold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'موقع التائه',
            style: TextStyle(
              color: AppColorsLightTheme.blueTextColor,
              fontFamily: FontsPath.sukarBlack,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "${lostPersonDataEntity.city!} : ${lostPersonDataEntity.area!}",
            style: TextStyle(
              color:
              AppColorsLightTheme.bottomNavBarGreyIconColor,
              fontFamily: FontsPath.sukarBold,
              fontSize: 16.sp,
            ),
          )
        ],
      ),
    );
  }
}
