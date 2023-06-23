import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/assets_path/fonts_path.dart';
import '../../core/theme/app_colors_light_theme.dart';
import '../controllers/google_maps_cubit/google_maps_cubit.dart';
import '../controllers/google_maps_cubit/google_maps_state.dart';
import '../controllers/lost_people_cubit/lost_people_cubit.dart';
import 'google_maps_widgets/choose_location_type_alert_dialog.dart';

class ChooseLocationWidget extends StatelessWidget {
  const ChooseLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? cityName;
    return BlocConsumer<GoogleMapsCubit, GoogleMapsState>(
      buildWhen: (p, c) =>
      (p != c && c is ChosenCurrentPositionName),
      listener: (context, state) {
        var cubit = GoogleMapsCubit.get(context);
        var lostPeopleCubit = LostPeopleCubit.get(context);
        if (state is ChosenCurrentPositionName) {
          cityName = state.cityName;
          lostPeopleCubit.lat = cubit.latLng!.latitude;
          lostPeopleCubit.lng = cubit.latLng!.longitude;
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () async{
            showDialog(
              context: context,
              builder: (context) {
                return const ChooseLocationAlertDialog();
              },
            );
          },
          child: Container(
            height: 66.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.authTextFieldFillColor,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.my_location,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Text(
                    cityName==null?'اختر الموقع':cityName!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontFamily: FontsPath.sukarRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
