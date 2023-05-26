import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../controllers/lost_people_cubit/lost_people_cubit.dart';
import '../../controllers/lost_people_cubit/lost_people_state.dart';

class CityDropDown extends StatelessWidget {
  const CityDropDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LostPeopleCubit, LostPeopleState>(
      buildWhen: (p, c) =>
      (p != c && c is ChangeCityDropdownValueSuccess||c is GetCitiesSuccess||c is GetCitiesLoading),
      listener: (context, state) {
        var cubit = LostPeopleCubit.get(context);
        if(state is ChangeCityDropdownValueSuccess){
          cubit.getAreas(state.cityId);
        }
      },
      builder: (context, state) {
        var cubit = LostPeopleCubit.get(context);
        return Container(
          height: 55.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: AppColorsLightTheme.authTextFieldFillColor,
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: cubit.citiesList != null
              ? DropdownButton(
                  items: cubit.citiesList!
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.cityAr!),
                          ))
                      .toList(),
                  onChanged: cubit.changeCityDropDownValue,
                  value: cubit.cityEntity,
                  borderRadius: BorderRadius.circular(25.r),
                  elevation: 0,
                  hint: const Text("المدينة"),
                  isExpanded: true,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontFamily: FontsPath.sukarRegular),
                  dropdownColor: AppColorsLightTheme.authTextFieldFillColor,
                  underline: const SizedBox.shrink(),
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
        );
      },
    );
  }
}
