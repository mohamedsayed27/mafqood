import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/app_router/screens_name.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/custom_button.dart';

import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/auth_widgets/auth_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColorsLightTheme.whitColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h,),
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
                SizedBox(height: 15.h,),
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.grey,size: 35.r,),),
                SizedBox(height: 15.h,),
                Text(
                  'إنشاء حساب',
                  style: TextStyle(
                    color: AppColorsLightTheme.blueTextColor,
                    fontFamily: FontsPath.sukarBlack,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(height: 24.h,),
                AuthTextFormField(
                  hintText: 'الاسم الاول',
                  controller: firstNameController,
                ),
                SizedBox(height: 24.h,),
                AuthTextFormField(
                  hintText: 'الاسم الثاني',
                  controller: secondNameController,
                ),
                SizedBox(height: 24.h,),
                AuthTextFormField(
                  hintText: 'رقم الهاتف',
                  controller: phoneController,
                  prefix: const Icon(
                    Icons.phone,
                    color: AppColorsLightTheme.primaryColor,
                  ),
                ),
                SizedBox(height: 24.h,),
                AuthTextFormField(
                  hintText: 'كلمة المرور',
                  controller: passwordController,
                  isPassword: true,
                ),
                SizedBox(height: 24.h,),
                AuthTextFormField(
                  hintText: 'تأكيد كلمة المرور',
                  controller: confirmPasswordController,
                  isPassword: true,
                ),
                SizedBox(height: 26.h,),
                CustomButton(buttonTitle: 'انشاء خساب', isTapped: (){
                  Navigator.pushNamed(context, ScreenName.otpVerificationNumberScreen);
                }, width: double.infinity),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamedAndRemoveUntil(context, ScreenName.loginScreen,(route) => false);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'هل لديك حساب؟  ',
                        children: [
                          TextSpan(
                            text: 'تسجيل الدخول',
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
