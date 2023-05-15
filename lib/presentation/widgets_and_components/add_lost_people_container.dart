import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/theme/app_colors_light_theme.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/image_picher_container.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/upload_data_component.dart';

import '../../core/assets_path/fonts_path.dart';

class AddLostPeopleContainer extends StatefulWidget {
  final TextEditingController? name;
  final TextEditingController? date;
  final TextEditingController? locationName;
  final TextEditingController? street;
  final TextEditingController? phone;

  const AddLostPeopleContainer(
      {Key? key,
      this.name,
      this.date,
      this.locationName,
      this.street,
      this.phone})
      : super(key: key);

  @override
  State<AddLostPeopleContainer> createState() => _AddLostPeopleContainerState();
}

class _AddLostPeopleContainerState extends State<AddLostPeopleContainer> {
  RangeValues values = RangeValues(1, 100);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 623.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColorsLightTheme.greyColorContainers,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h,),
          UploadDataWidget(
            controller: TextEditingController(),
            fieldTitle: 'اكتب الاسم',
            fieldHintText: 'الاسم',
            iconPath: Icons.person,
          ),
          SizedBox(height: 20.h,),
          Container(
            height: 66.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColorsLightTheme.authTextFieldFillColor,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.my_location,
                  color: AppColorsLightTheme.primaryColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Text(
                    'الموقع',
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
          SizedBox(height: 20.h,),
          ImagePickerContainer(),
          SizedBox(height: 20.h,),
          Container(
            height: 121.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
            width: 286.w,
            decoration: BoxDecoration(
              color: AppColorsLightTheme.authTextFieldFillColor,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: RangeSlider(
              max: 100,
              min: 1,
              inactiveColor: Colors.grey.withOpacity(0.5),
              activeColor: AppColorsLightTheme.primaryColor,
              values: values,
              onChanged: (RangeValues values) {},
            ),
          )
        ],
      ),
    );
  }
}
