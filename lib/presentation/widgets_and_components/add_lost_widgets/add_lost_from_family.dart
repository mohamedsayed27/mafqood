import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mafqood/core/theme/app_colors_light_theme.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/area_drop_down_button.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/city_dropdown.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/custom_button.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/image_picher_container.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/phone_form_field.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/constants/constants.dart';
import '../../../domain/usecases/lost_people_usecases/add_lost_person_usecase.dart';
import '../../controllers/lost_people_cubit/lost_people_cubit.dart';
import '../../controllers/lost_people_cubit/lost_people_state.dart';
import '../auth_widgets/custom_text_form_field.dart';
import '../choose_location_widget.dart';
import '../shred_widgets/simple_dialog_option.dart';

class AddLostPersonFromFamily extends StatefulWidget {
  const AddLostPersonFromFamily({
    Key? key,
  }) : super(key: key);

  @override
  State<AddLostPersonFromFamily> createState() =>
      _AddLostPersonFromFamilyState();
}

class _AddLostPersonFromFamilyState extends State<AddLostPersonFromFamily> {
  RangeValues values = const RangeValues(1, 5);
  TextEditingController date = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColorContainers,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          BlocConsumer<LostPeopleCubit, LostPeopleState>(
            buildWhen: (p, c)=>(p != c && c is GetPickedImageSuccessState ||
                c is GetPickedImageErrorState),
            listener: (context, state) {
              var cubit = LostPeopleCubit.get(context);
              if(state is GetPickedImageSuccessState){
                cubit.lostPersonFromFamilyImage = state.image;
              }
            },
            builder: (context, state) {
              var cubit = LostPeopleCubit.get(context);
              return ImagePickerContainer(
                image: cubit.lostPersonFromFamilyImage,
                pickImageFromCamera: () {
                  cubit.getImagePick(0, cubit.lostPersonFromFamilyImage);
                },
                pickImageFromGallery: () {
                  cubit.getImagePick(1, cubit.lostPersonFromAnonymousImage);
                },
                chooseAnotherImage: (){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text(
                          "قم بأختيار صورة",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontFamily: FontsPath.sukarBold,
                          ),
                        ),
                        children: [
                          CustomSimpleDialogOption(
                            title: 'التقط صوره',
                            onPressed: () {
                              Navigator.of(context).pop();
                              cubit.getImagePick(
                                0,
                                cubit.searchLostPersonImage,
                              );
                            },
                          ),
                          CustomSimpleDialogOption(
                            title: 'قم بأختيار صورة',
                            onPressed: () {
                              Navigator.of(context).pop();
                              cubit.getImagePick(
                                1,
                                cubit.searchLostPersonImage,
                              );
                            },
                          ),
                          CustomSimpleDialogOption(
                            title: 'الغاء',
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomTextFormField(
            readOnly: false,
            onTap: () {},
            hintText: 'اكتب الاسم',
            controller: name,
            keyboardType: TextInputType.text,
            prefix: const Icon(
              Icons.person,
              color: AppColors.primaryColor,
            ),
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
                print(state.dateTime.toString());
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            builder: (context, state) {
              var cubit = LostPeopleCubit.get(context);
              return CustomTextFormField(
                readOnly: true,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  cubit.selectTDateTime(context);
                },
                hintText: 'التاريخ',
                controller: date,
                keyboardType: TextInputType.text,
                prefix: const Icon(
                  Icons.calendar_month,
                  color: AppColors.primaryColor,
                ),
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          const ChooseLocationWidget(),
          SizedBox(
            height: 25.h,
          ),
          PhoneFormField(
            hintText: 'رقم الهاتف',
            controller: phoneController,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextFormField(
            readOnly: false,
            onTap: () {},
            hintText: 'اكتب اسم الحي',
            controller: street,
            keyboardType: TextInputType.text,
            prefix: const Icon(
              Icons.add_road,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          const CityDropDown(),
          SizedBox(
            height: 25.h,
          ),
          const AreaDropDown(),
          SizedBox(
            height: 20.h,
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
                  if (cubit.cityEntity == null && cubit.areaEntity == null) {
                    showToast(errorType: 1, message: "يجب اختيار المدينة والمركز");
                  } else if (cubit.lostPersonFromFamilyImage == null) {
                    showToast(errorType: 1, message: "يجب اختيار صورة المفقود");
                  } else {
                    cubit.addLostPersonDataFromFamily(
                      AddLostPersonFromFamilyDataParameters(
                        name: name.text,
                        street: street.text,
                        area: cubit.areaEntity!.areaAr,
                        city: cubit.cityEntity!.cityAr!,
                        phone: phoneController.text,
                        image: cubit.lostPersonFromFamilyImage!,
                        lng: cubit.lng!,
                        lat: cubit.lat!,
                        birthDate: date.text,
                      ),
                    );
                  }
                },
                width: double.infinity,
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
