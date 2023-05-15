import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/phone_form_field.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../auth_widgets/auth_text_form_field.dart';

class UploadDataWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData? iconPath;
  final String fieldTitle;
  final String fieldHintText;
  final bool isPhone;
  final bool readOnly;
  final void Function()? onTap;

  const UploadDataWidget(
      {Key? key,
      required this.controller,
      this.iconPath,
      this.isPhone = false,
      required this.fieldTitle,
      required this.fieldHintText,
      this.onTap,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldTitle,
          style: TextStyle(
            color: AppColorsLightTheme.blueTextColor,
            fontFamily: FontsPath.sukarRegular,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        isPhone
            ? PhoneFormField(
                hintText: fieldHintText,
                controller: controller,
              )
            : AuthTextFormField(
                readOnly: readOnly,
                onTap: onTap,
                hintText: fieldHintText,
                controller: controller,
                keyboardType: TextInputType.text,
                prefix: Icon(
                  iconPath,
                  color: AppColorsLightTheme.primaryColor,
                ),
              ),
      ],
    );
  }
}
