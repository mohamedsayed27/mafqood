import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/constants/constants.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/help_lost_person.dart';

import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';
import '../../controllers/google_maps_cubit/google_maps_cubit.dart';
import '../../controllers/google_maps_cubit/google_maps_state.dart';
import '../../controllers/lost_people_cubit/lost_people_cubit.dart';
import '../../controllers/lost_people_cubit/lost_people_state.dart';
import '../../widgets_and_components/google_maps_widgets/choose_location_type_alert_dialog.dart';
import '../../widgets_and_components/shred_widgets/custom_button.dart';

class SearchPerson extends StatefulWidget {
  const SearchPerson({Key? key}) : super(key: key);

  @override
  State<SearchPerson> createState() => _SearchPersonState();
}

class _SearchPersonState extends State<SearchPerson> {
  double? lat;
  double? lng;
  String loc = 'اختر موقعك';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        children: [
          SizedBox(height: 30.h,),
          BlocConsumer<LostPeopleCubit, LostPeopleState>(
            buildWhen: (p, c) => (p != c && c is GetLostPersonPickedImageSuccessState ||
                c is GetLostPersonPickedImageErrorState),
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = LostPeopleCubit.get(context);
              return InkWell(
                onTap: () {
                  cubit.getLostPersonImagePicked(1);
                },
                child: Container(
                  height: 200,
                  width: 250,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: cubit.lostPersonImage == null
                      ? null
                      : Image.file(
                    cubit.lostPersonImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 30.h,),
          BlocConsumer<GoogleMapsCubit, GoogleMapsState>(
            buildWhen: (p, c) =>
            (p != c && c is ChosenCurrentPositionName),
            listener: (context, state) {
              var cubit = GoogleMapsCubit.get(context);
              if (state is ChosenCurrentPositionName) {
                loc = state.cityName;
                lat = cubit.latLng!.latitude;
                lng = cubit.latLng!.longitude;
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
                  height: 100.h,
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 2.h
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColorsLightTheme.authTextFieldFillColor,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: AppColorsLightTheme.primaryColor,
                      ),
                      SizedBox(width: 10.w,),
                      Expanded(
                        child: Text(
                          loc,
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
          ),
          SizedBox(height: 100.h,),
          BlocConsumer<LostPeopleCubit, LostPeopleState>(
            buildWhen: (p, c) => false,
            listener: (context, state) {
              if(state is SendLostPersonDataLoading){
                showProgressIndicator(context);
              }
              if(state is SendLostPersonDataSuccess){
                Navigator.pop(context);
                showToast(errorType: 0, message: state.lostPeopleEntity.message!);
              }
              if(state is SendLostPersonDataError){
                showToast(errorType: 1, message: state.authErrorException.authErrorModel.message);
              }
            },
            builder: (context, state) {
              var cubit = LostPeopleCubit.get(context);
              return CustomButton(
                buttonTitle: 'اضاغة',
                isTapped: () async {
                  if(cubit.lostPersonImage==null){
                    showToast(errorType: 1, message: "يجب اختيار صوره");
                  }else{
                    if(lat!=null&&lng!=null){
                      cubit.sendLostPersonData(HelpLostPersonDataParameters(image: cubit.lostPersonImage!, lng: lng!, lat: lat!));
                    }else{
                      showToast(errorType: 1, message: "يجب اختيار العنوان");
                    }
                  }
                },
                width: double.infinity,
              );
            },
          )
        ],
      ),
    );
  }
}
