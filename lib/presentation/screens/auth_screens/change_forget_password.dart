import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/auth_widgets/pin_field_builder.dart';
import '../../widgets_and_components/shred_widgets/custom_button.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';
import '../../widgets_and_components/shred_widgets/password_form_field.dart';
import '../../widgets_and_components/shred_widgets/phone_form_field.dart';

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
                const LogoText(),
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
                PhoneFormField(hintText: 'رقم الهاتف', controller: phoneController,),
                SizedBox(height: 20.h,),
                PasswordFormField(hintText: 'كلمة المرور', controller: passwordController,),
                SizedBox(height: 20.h,),
                PasswordFormField(hintText: 'تأكيد كلمة المرور', controller: confirmPasswordController,isConfirmPassword: true,confirmController: passwordController),
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
