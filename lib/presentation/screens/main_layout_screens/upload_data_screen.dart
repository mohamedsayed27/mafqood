import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mafqood/core/global/assets_path/images_path.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/custom_button.dart';

import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/auth_widgets/auth_text_form_field.dart';
import '../../widgets_and_components/shred_widgets/custom_drop_down_button.dart';

class UploadData extends StatefulWidget {
  const UploadData({Key? key}) : super(key: key);

  @override
  State<UploadData> createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadData> {
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController street = TextEditingController();
  DateTime? dateTime;

  _selectImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("قم بأختيار صورة"),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('التقط صوره'),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('قم بأختيار صورة'),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('الغاء'),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(height: 30.h,),
          InkWell(
            onTap: (){
              _selectImage(context);
            },
            child: Container(
              width: 100.w,
              height: 100.h,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                color: AppColorsLightTheme.primaryColor,
                shape: BoxShape.circle
              ),
              child: Center(
                child: Icon(Icons.add_a_photo,color: Colors.white,size: 32.r,)
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Text(
            'اكتب الاسم',
            style: TextStyle(
              color: AppColorsLightTheme.blueTextColor,
              fontFamily: FontsPath.sukarRegular,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 10.h,),
          AuthTextFormField(
            hintText: 'الاسم',
            controller: name,
            keyboardType: TextInputType.text,
            prefix: const Icon(
              Icons.person,
              color: AppColorsLightTheme.primaryColor,
            ),
          ),
          SizedBox(height: 20.h,),
          Text(
            'اختر التاريخ',
            style: TextStyle(
              color: AppColorsLightTheme.blueTextColor,
              fontFamily: FontsPath.sukarRegular,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 10.h,),
          AuthTextFormField(
            hintText: 'التاريخ',
            controller: date,
            keyboardType: TextInputType.text,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: dateTime ?? DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData().copyWith(
                      colorScheme: const ColorScheme.light(
                          primary: AppColorsLightTheme.primaryColor,
                          secondary: Colors.white),
                      dialogBackgroundColor: Colors.white,
                    ),
                    child: child!,
                  );
                },
              ).then((value) {
                setState(() {
                  dateTime = value;
                  date.text = Jiffy(dateTime).yMMMd.toString();
                });
              }).catchError((error) {
                return;
              });
            },
            prefix: const Icon(
              Icons.calendar_month,
              color: AppColorsLightTheme.primaryColor,
            ),
          ),
          SizedBox(height: 20.h,),
          Text(
            'اكتب اسم الحي',
            style: TextStyle(
              color: AppColorsLightTheme.blueTextColor,
              fontFamily: FontsPath.sukarRegular,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 10.h,),
          AuthTextFormField(
            hintText: 'اكتب الحي',
            controller: street,
            keyboardType: TextInputType.text,
            prefix: const Icon(
              Icons.add_road,
              color: AppColorsLightTheme.primaryColor,
            ),
          ),
          SizedBox(height: 20.h,),
          Text(
            'اختر المدينة',
            style: TextStyle(
              color: AppColorsLightTheme.blueTextColor,
              fontFamily: FontsPath.sukarRegular,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 10.h,),
          const CustomDropDown(title: 'المحافظه',),
          SizedBox(height: 20.h,),
          Text(
            'اختر المركز',
            style: TextStyle(
              color: AppColorsLightTheme.blueTextColor,
              fontFamily: FontsPath.sukarRegular,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 10.h,),
          const CustomDropDown(title: 'المركز',),
          SizedBox(height: 30.h,),
          CustomButton(buttonTitle: 'اضاغة', isTapped: (){}, width: double.infinity)
        ],
      ),
    );
  }
}
