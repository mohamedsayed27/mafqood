import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_cubit.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_state.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';

class AgeRangeWidget extends StatelessWidget {
  const AgeRangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LostPeopleCubit, LostPeopleState>(
      buildWhen: (p, c) => (p != c && c is ChangeAgeValueSuccess),
      builder: (context, state) {
        var cubit = LostPeopleCubit.get(context);
        return Container(
          height: 121.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
          width: 286.w,
          decoration: BoxDecoration(
            color: AppColorsLightTheme.authTextFieldFillColor,
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: Column(
            children: [
              Expanded(
                child: RangeSlider(
                  max: 100,
                  min: 1,
                  inactiveColor: Colors.grey.withOpacity(0.5),
                  activeColor: AppColorsLightTheme.primaryColor,
                  values: cubit.values,
                  onChanged: cubit.changeAgeRangeValueValue,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${cubit.values.start.round()} سنه",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColorsLightTheme.bottomNavBarGreyIconColor,
                      fontFamily: FontsPath.sukarBold,
                    ),
                  ),
                  Text(
                    "${cubit.values.end.round()} سنه",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColorsLightTheme.bottomNavBarGreyIconColor,
                      fontFamily: FontsPath.sukarBold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
