import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';

class CustomDropDown extends StatefulWidget {
  final String title;
  const CustomDropDown({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

List<String> namesList = [
  'مدينة1',
  'مدينة2',
];

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColorsLightTheme.authTextFieldFillColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: DropdownButton(
        items: namesList
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedValue=value;
          });
        },
        value: selectedValue,
        borderRadius: BorderRadius.circular(25.r),
        elevation: 0,
        hint: Text(widget.title),
        isExpanded: true,
        style: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
            fontFamily: FontsPath.sukarRegular),
        dropdownColor: AppColorsLightTheme.authTextFieldFillColor,
        underline: const SizedBox.shrink(),
      ),
    );
  }
}
