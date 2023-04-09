import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/app_router/screens_name.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/custom_button.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/reg_exp.dart';
import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';
import '../../controllers/user_cubit/user_cubit.dart';
import '../../controllers/user_cubit/user_state.dart';
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
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColorsLightTheme.whitColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: formKey,
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
                    height: 15.h,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                      size: 35.r,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'إنشاء حساب',
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
                    hintText: 'الاسم الاول',
                    controller: firstNameController,
                    prefix: const Icon(
                      Icons.person,
                      color: AppColorsLightTheme.primaryColor,
                    ),
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "يجب ادخال الاسم";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  AuthTextFormField(
                    hintText: 'الاسم الثاني',
                    controller: secondNameController,
                    prefix: const Icon(
                      Icons.person,
                      color: AppColorsLightTheme.primaryColor,
                    ),
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "يجب ادخال الاسم";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  AuthTextFormField(
                    hintText: 'رقم الهاتف',
                    controller: phoneController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "يجب ادخال الهاتف";
                      } else if (!RegularExp.egyptPhoneRegex.hasMatch(value)) {
                        return "صيغة الهاتف غير صحيحة";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
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
                    keyboardType: TextInputType.visiblePassword,
                    prefix: const Icon(
                      Icons.lock,
                      color: AppColorsLightTheme.primaryColor,
                    ),
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "يجب ادخال كلمة المرور";
                      } else if (!RegularExp.passwordRegex.hasMatch(value)) {
                        return "كلمة المرور ضعيفة";
                      }
                      return null;
                    },
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'يجب ان تتكون كلمة المرور من رموز واحرف صغيرة وكبيرة وارقام',
                    style: TextStyle(
                      color: AppColorsLightTheme.blueTextColor,
                      fontFamily: FontsPath.sukarBlack,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  AuthTextFormField(
                    hintText: 'تأكيد كلمة المرور',
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    validate: (value) {
                      if (confirmPasswordController.text !=
                          passwordController.text) {
                        return "كلمة المرور غير متطابقة";
                      }
                      return null;
                    },
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  BlocConsumer<UserCubit, UserState>(
                    buildWhen: (previous, current) {
                      // if (previous != current &&
                      //     current is RegisterError ||
                      //     current is RegisterSuccess ||
                      //     current is RegisterLoading ) {
                      //   return true;
                      // } else {
                        return false;
                      // }
                    },
                    listener: (context, state) {
                      if (state is RegisterLoading) {
                        showProgressIndicator(context);
                      } else if (state is RegisterSuccess) {
                        Navigator.pop(context);
                        showToast(
                            errorType: 0,
                            message: state.authenticationEntity.message!);
                        print(state.authenticationEntity);
                      } else if (state is RegisterError) {
                        Navigator.pop(context);
                        showToast(
                            errorType: 1,
                            message: state
                                .authErrorException.authErrorModel.errors[0]);
                        print(state.authErrorException.authErrorModel);
                      }
                    },
                    builder: (context, state) {
                      print("register");
                      var cubit = UserCubit.get(context);
                      return CustomButton(
                        buttonTitle: 'انشاء خساب',
                        isTapped: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (formKey.currentState!.validate()) {
                            cubit.register(
                              password: passwordController.text,
                              phone: phoneController.text,
                              firstName: firstNameController.text,
                              lastName: secondNameController.text,
                            );
                          }
                        },
                        width: double.infinity,
                      );
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, ScreenName.loginScreen, (route) => false);
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
      ),
    );
  }
}
