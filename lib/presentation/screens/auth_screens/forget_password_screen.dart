import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/app_router/screens_name.dart';

import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/auth_widgets/auth_text_form_field.dart';
import '../../widgets_and_components/shred_widgets/custom_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColorsLightTheme.whitColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: Text(
                    'مفقود',
                    style: TextStyle(
                      color: AppColorsLightTheme.blueTextColor,
                      fontFamily: FontsPath.sukarBold,
                      fontSize: 64.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'استرجاع كلمة المرور',
                  style: TextStyle(
                    color: AppColorsLightTheme.blueTextColor,
                    fontFamily: FontsPath.sukarBlack,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                RichText(
                  text: TextSpan(
                    text: 'ادخل رقم الهاتف وسيتم ارسال رسالة  ',
                    children: [
                      TextSpan(
                        text: 'SMS',
                        style: TextStyle(
                          color: AppColorsLightTheme.blueTextColor,
                          fontFamily: FontsPath.sukarBold,
                          fontSize: 18.sp,
                        ),
                      ),
                      TextSpan(
                        text: '  لاسترجاع الحساب',
                        style: TextStyle(
                          color: AppColorsLightTheme.greyTextColor,
                          fontFamily: FontsPath.sukarBlack,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                    style: TextStyle(
                      color: AppColorsLightTheme.greyTextColor,
                      fontFamily: FontsPath.sukarBlack,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                AuthTextFormField(
                  hintText: 'رقم الهاتف',
                  controller: phoneController,
                  prefix: const Icon(
                    Icons.phone,
                    color: AppColorsLightTheme.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomButton(
                    buttonTitle: 'اسنرجاع',
                    isTapped: () {
                      Navigator.pushNamed(context, ScreenName.changeForgetPasswordScreen);
                    },
                    width: double.infinity,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
