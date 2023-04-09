import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/constants/reg_exp.dart';
import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/auth_widgets/auth_text_form_field.dart';
import '../../widgets_and_components/auth_widgets/pin_field_builder.dart';
import '../../widgets_and_components/shred_widgets/custom_button.dart';

class ChangeForgottenPassword extends StatefulWidget {
  const ChangeForgottenPassword({Key? key}) : super(key: key);

  @override
  State<ChangeForgottenPassword> createState() => _ChangeForgottenPasswordState();
}

class _ChangeForgottenPasswordState extends State<ChangeForgottenPassword> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController pinFieldController = TextEditingController();
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
                  'تغيير كلمة المرور',
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
                    text: 'ادخل رقم الهاتف وكلمة مرور جديدة و كود تفعيل  ',
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
                        text: '  لتغيير كلمة المرور',
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
                  height: 25.h,
                ),
                AuthTextFormField(
                  hintText: 'رقم الهاتف',
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  prefix: const Icon(
                    Icons.phone,
                    color: AppColorsLightTheme.primaryColor,
                  ),
                ),
                SizedBox(height: 20.h,),
                AuthTextFormField(
                  hintText: 'كلمة المرور',
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  prefix: const Icon(
                    Icons.lock,
                    color: AppColorsLightTheme.primaryColor,
                  ),
                  isPassword: true,
                ),
                SizedBox(height: 20.h,),
                AuthTextFormField(
                  hintText: 'تأكيد كلمة المرور',
                  prefix: const Icon(
                    Icons.lock,
                    color: AppColorsLightTheme.primaryColor,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  controller: confirmPasswordController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "يجب ادخال الهاتف";
                    } else if (!RegularExp.egyptPhoneRegex.hasMatch(value)) {
                      return "صيغة الهاتف غير صحيحة";
                    }
                    return null;
                  },
                  isPassword: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: PinFieldBuilder(
                    controller: pinFieldController,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomButton(
                  buttonTitle: 'تغيير',
                  isTapped: () {
                    Navigator.pushNamedAndRemoveUntil(context, ScreenName.loginScreen,(route) => false);
                  },
                  width: double.infinity,),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
