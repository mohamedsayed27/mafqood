import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/custom_button.dart';

import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/auth_widgets/auth_text_form_field.dart';
import '../../widgets_and_components/intro_screens_widgets/boarding_button.dart';

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
                Icon(Icons.arrow_back,color: Colors.grey,size: 35.r,),
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
                CustomButton(buttonTitle: 'انشاء خساب', isTapped: (){}, width: double.infinity)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
