import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/domain/entities/lost_person_data_entity.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';

class PersonDataScreen extends StatelessWidget {
  final LostPersonDataEntity lostPersonDataEntity;
  const PersonDataScreen({Key? key, required this.lostPersonDataEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 150.h,
            width: 150.w,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.r)),
            child: Image.network(
              lostPersonDataEntity.url!,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'الاسم',
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
            '${lostPersonDataEntity.name}',
            style: TextStyle(
              color: AppColorsLightTheme.bottomNavBarGreyIconColor,
              fontFamily: FontsPath.sukarBold,
              fontSize: 16.sp,
            ),
          ),
          Text(
            'الشارع',
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
            '${lostPersonDataEntity.street}',
            style: TextStyle(
              color: AppColorsLightTheme.bottomNavBarGreyIconColor,
              fontFamily: FontsPath.sukarBold,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
