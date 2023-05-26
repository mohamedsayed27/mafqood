import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/app_router/screens_name.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/reg_exp.dart';
import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../controllers/user_cubit/user_cubit.dart';
import '../../controllers/user_cubit/user_state.dart';
import '../../widgets_and_components/auth_widgets/custom_text_form_field.dart';
import '../../widgets_and_components/shred_widgets/custom_button.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';

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
                const LogoText(),
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
                CustomTextFormField(
                  hintText: 'رقم الهاتف',
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "يجب ادخال الهاتف";
                    } else if (!RegularExp.egyptPhoneRegex.hasMatch(value)) {
                      return "صيغة الهاتف غير صحيحة";
                    }
                    return null;
                  },
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
                BlocConsumer<UserCubit, UserState>(
                  buildWhen: (p,c){
                    return false;
                  },
                  listener: (context, state) {
                    if(state is ForgetPasswordLoading){
                      showProgressIndicator(context);
                    }
                    if(state is ForgetPasswordSuccess){
                      Navigator.pop(context);
                      showToast(errorType: 0, message: state.authenticationEntity.message!);
                      Navigator.pushNamedAndRemoveUntil(context, ScreenName
                          .changeForgetPasswordScreen, (route) => false,arguments: phoneController.text);
                    }
                    if(state is ForgetPasswordError){
                      Navigator.pop(context);
                      showToast(errorType: 1, message: state.authErrorException.authErrorModel.message);
                    }
                  },
                  builder: (context, state) {
                    var cubit = UserCubit.get(context);
                    return CustomButton(
                      buttonTitle: 'اسنرجاع',
                      isTapped: () {
                        cubit.forgetPassword(phone: phoneController.text);
                      },
                      width: double.infinity,);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
