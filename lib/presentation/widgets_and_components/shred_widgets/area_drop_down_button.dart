import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../controllers/lost_people_cubit/lost_people_cubit.dart';
import '../../controllers/lost_people_cubit/lost_people_state.dart';

class AreaDropDown extends StatelessWidget {
  const AreaDropDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LostPeopleCubit, LostPeopleState>(
      buildWhen: (p, c) =>
      (p != c && c is ChangeAreaDropdownValueSuccess||c is GetAreasSuccess||c is GetAreasLoading),
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
          child: cubit.areaList != null
              ? DropdownButton(
                  items: cubit.areaList!
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.areaAr),
                          ))
                      .toList(),
                  onChanged: cubit.changeAreaDropDownValue,
                  value: cubit.areaEntity,
                  borderRadius: BorderRadius.circular(25.r),
                  elevation: 0,
                  hint: const Text("المركز"),
                  isExpanded: true,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontFamily: FontsPath.sukarRegular),
                  dropdownColor: AppColorsLightTheme.authTextFieldFillColor,
                  underline: const SizedBox.shrink(),
                )
              : Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "اختر المدينة اولا",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontFamily: FontsPath.sukarRegular,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
