import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mafqood/core/assets_path/fonts_path.dart';
import 'package:mafqood/core/theme/app_colors_light_theme.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/custom_button.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/image_picher_container.dart';

import '../../../core/constants/constants.dart';
import '../../../domain/usecases/lost_people_usecases/help_lost_person_usecase.dart';
import '../../controllers/lost_people_cubit/lost_people_cubit.dart';
import '../../controllers/lost_people_cubit/lost_people_state.dart';
import '../auth_widgets/custom_text_form_field.dart';
import '../choose_location_widget.dart';
import '../shred_widgets/simple_dialog_option.dart';
import 'age_range_widget.dart';

class AddLostPersonFromAnonymous extends StatefulWidget {
  const AddLostPersonFromAnonymous({
    Key? key,
  }) : super(key: key);

  @override
  State<AddLostPersonFromAnonymous> createState() =>
      _AddLostPersonFromAnonymousState();
}

class _AddLostPersonFromAnonymousState
    extends State<AddLostPersonFromAnonymous> {
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
        color: AppColorsLightTheme.greyColorContainers,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          BlocConsumer<LostPeopleCubit, LostPeopleState>(
            listener: (context, state) {
              var cubit = LostPeopleCubit.get(context);
              if(state is GetPickedImageSuccessState){
                cubit.lostPersonFromAnonymousImage = state.image;
                print(cubit.lostPersonFromAnonymousImage);
              }
            },
            builder: (context, state) {
              var cubit = LostPeopleCubit.get(context);
              return ImagePickerContainer(
                image: cubit.lostPersonFromAnonymousImage,
                pickImageFromCamera: () {
                  cubit.getImagePick(0, cubit.lostPersonFromAnonymousImage);
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
              color: AppColorsLightTheme.primaryColor,
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
                  color: AppColorsLightTheme.primaryColor,
                ),
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          const ChooseLocationWidget(),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "اختر الفئة العمرية",
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColorsLightTheme.primaryColor,
                fontFamily: FontsPath.sukarBold,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const AgeRangeWidget(),
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
                  if (cubit.lostPersonFromAnonymousImage == null) {
                    showToast(errorType: 1, message: "يجب اختيار صوره");
                  } else {
                    if (cubit.lat != null && cubit.lng != null) {
                      cubit.sendLostPersonData(
                        AddLostPersonsDataFromAnonymousParameters(
                          image: cubit.lostPersonFromAnonymousImage!,
                          lng: cubit.lng!,
                          lat: cubit.lat!,
                          name: name.text,
                          maxEdge: cubit.values.end.round(),
                          minEdge: cubit.values.start.round(),
                        ),
                      );
                    } else {
                      showToast(errorType: 1, message: "يجب اختيار العنوان");
                    }
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
