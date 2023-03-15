import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/app_router/screens_name.dart';

import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/auth_widgets/auth_text_form_field.dart';
import '../../widgets_and_components/shred_widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  'تسجيل دخول',
                  style: TextStyle(
                    color: AppColorsLightTheme.blueTextColor,
                    fontFamily: FontsPath.sukarBlack,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(
                  height: 24.h,
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
                  height: 24.h,
                ),
                AuthTextFormField(
                  hintText: 'كلمة المرور',
                  controller: passwordController,
                  isPassword: true,
                ),
                SizedBox(
                  height: 26.h,
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, ScreenName.forgetPasswordScreen);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'هل نسيت كلمة المرور؟  ',
                      children: [
                        TextSpan(
                          text: 'استرجاع',
                          style: TextStyle(
                            color: AppColorsLightTheme.blueTextColor,
                            fontFamily: FontsPath.sukarBold,
                            fontSize: 16.sp,
                          ),
                        )
                      ],
                      style: TextStyle(
                        color: AppColorsLightTheme.greyTextColor,
                        fontFamily: FontsPath.sukarBlack,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomButton(
                    buttonTitle: 'نسجيل الدخول',
                    isTapped: () {},
                    width: double.infinity),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, ScreenName.registerScreen);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'ليس لديك حساب؟  ',
                        children: [
                          TextSpan(
                            text: 'انشاء حساب',
                            style: TextStyle(
                              color: AppColorsLightTheme.blueTextColor,
                              fontFamily: FontsPath.sukarBold,
                              fontSize: 16.sp,
                            ),
                          )
                        ],
                        style: TextStyle(
                          color: AppColorsLightTheme.greyTextColor,
                          fontFamily: FontsPath.sukarBlack,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
