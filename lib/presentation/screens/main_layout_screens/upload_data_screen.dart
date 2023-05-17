import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mafqood/core/app_router/screens_name.dart';
import 'package:mafqood/presentation/controllers/google_maps_cubit/google_maps_state.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_cubit.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_state.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/custom_button.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../../domain/usecases/lost_people_usecases/add_lost_person_usecase.dart';
import '../../controllers/google_maps_cubit/google_maps_cubit.dart';
import '../../widgets_and_components/google_maps_widgets/choose_location_type_alert_dialog.dart';
import '../../widgets_and_components/shred_widgets/custom_drop_down_button.dart';
import '../../widgets_and_components/shred_widgets/upload_data_component.dart';

class Args {
  final LatLng latLng;

  Args({required this.latLng});
}

class UploadData extends StatefulWidget {
  const UploadData({Key? key}) : super(key: key);

  @override
  State<UploadData> createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadData> {
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController locationName = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController phone = TextEditingController();
  DateTime? dateTime;
  String loc = 'اختر موقعك';
  double? lng;
  double? lat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(
            height: 30.h,
          ),
          BlocConsumer<LostPeopleCubit, LostPeopleState>(
            buildWhen: (p, c) => (p != c && c is GetPickedImageSuccessState ||
                c is GetPickedImageErrorState),
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = LostPeopleCubit.get(context);
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      width: 100.w,
                      height: 100.h,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                        color: AppColorsLightTheme.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: cubit.imagePicked != null
                          ? Image.file(
                              cubit.imagePicked!,
                              fit: BoxFit.cover,
                            )
                          : null),
                  Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                        cubit.selectImage(context,cubit.imagePicked!);
                      },
                      iconSize: 38.r,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      icon: Icon(
                        Icons.add_a_photo,
                        color: cubit.imagePicked != null
                            ? Colors.white60
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          UploadDataWidget(
            controller: phone,
            fieldTitle: 'اكتب رقم الهاتف',
            fieldHintText: 'رقم الهاتف',
            iconPath: Icons.phone,
            isPhone: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          UploadDataWidget(
            controller: name,
            fieldTitle: 'اكتب الاسم',
            fieldHintText: 'الاسم',
            iconPath: Icons.person,
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocConsumer<LostPeopleCubit, LostPeopleState>(
            buildWhen: (p, c) =>
                (p != c && c is GetDateTimePickedSuccessState ||
                    c is GetDateTimePickedErrorState),
            listener: (context, state) {
              if (state is GetDateTimePickedSuccessState) {
                date.text = Jiffy(state.dateTime).yMMMd;
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            builder: (context, state) {
              var cubit = LostPeopleCubit.get(context);
              return UploadDataWidget(
                controller: date,
                readOnly: true,
                fieldTitle: 'اختر التاريخ',
                fieldHintText: 'التاريخ',
                iconPath: Icons.calendar_month,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  cubit.selectTDateTime(context);
                },
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          UploadDataWidget(
            controller: street,
            fieldTitle: 'اكتب اسم الحي',
            fieldHintText: 'اكتب الحي',
            iconPath: Icons.add_road,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'اختر المدينة',
            style: TextStyle(
              color: AppColorsLightTheme.blueTextColor,
              fontFamily: FontsPath.sukarRegular,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomDropDown(
            title: 'المحافظه',
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'اختر المركز',
            style: TextStyle(
              color: AppColorsLightTheme.blueTextColor,
              fontFamily: FontsPath.sukarRegular,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomDropDown(
            title: 'المركز',
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocConsumer<GoogleMapsCubit, GoogleMapsState>(
            buildWhen: (p, c) =>
            (p != c && c is ChosenCurrentPositionName),
            listener: (context, state) {
              var cubit = GoogleMapsCubit.get(context);
              if (state is ChosenCurrentPositionName) {
                loc = state.cityName;
                lat = cubit.latLng!.latitude;
                lng = cubit.latLng!.longitude;
                print(lat);
                print(lng);
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
          SizedBox(
            height: 30.h,
          ),
          BlocConsumer<LostPeopleCubit, LostPeopleState>(
            buildWhen: (p, c) => (p != c && c is GetPickedImageSuccessState ||
                c is GetPickedImageErrorState),
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = LostPeopleCubit.get(context);
              return CustomButton(
                buttonTitle: 'اضاغة',
                isTapped: () async {
                  cubit.addLostPersonData(
                    AddLostPersonDataParameters(
                      name: name.text,
                      street: street.text,
                      area: "area area area",
                      city: "city city city",
                      phone: phone.text,
                      image: cubit.imagePicked!,
                      lng: lng!,
                      lat: lat!,
                      birthDate: date.text,
                    ),
                  );
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
