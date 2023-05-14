import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/app_router/screens_name.dart';
import 'package:mafqood/core/cache_manager/cache_keys.dart';
import 'package:mafqood/core/cache_manager/shared_preferences.dart';
import 'package:mafqood/presentation/controllers/user_cubit/user_cubit.dart';
import 'package:mafqood/presentation/controllers/user_cubit/user_state.dart';

import '../../../core/constants/constants.dart';
import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/shred_widgets/auth_text_button.dart';
import '../../widgets_and_components/shred_widgets/custom_button.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';
import '../../widgets_and_components/shred_widgets/password_form_field.dart';
import '../../widgets_and_components/shred_widgets/phone_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
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
                  const LogoText(),
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
                  PhoneFormField(
                    hintText: 'رقم الهاتف',
                    controller: phoneController,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  PasswordFormField(
                    hintText: 'كلمة المرور',
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ScreenName.forgetPasswordScreen);
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
                  BlocConsumer<UserCubit, UserState>(
                    buildWhen: (previous, current) {
                      return false;
                    },
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        showProgressIndicator(context);
                      } else if (state is LoginSuccess) {
                        Navigator.pop(context);
                        showToast(
                            errorType: 0,
                            message: state.authenticationEntity.message!);
                        print(state.authenticationEntity);
                        CacheHelper.saveData(key: CacheKeys.token, value: state.authenticationEntity.data!.token).whenComplete(() {
                          token = CacheHelper.getData(key: CacheKeys.token);
                          Navigator.pushNamedAndRemoveUntil(context,
                              ScreenName.mainLayoutScreen, (route) => false);
                        });
                      } else if (state is LoginError) {
                        Navigator.pop(context);
                        showToast(
                          errorType: 1,
                          message:
                              state.authErrorException.authErrorModel.errors[0],
                        );
                        print(state.authErrorException.authErrorModel);
                      }
                    },
                    builder: (context, state) {
                      print("login");
                      var cubit = UserCubit.get(context);
                      return CustomButton(
                          buttonTitle: 'نسجيل الدخول',
                          isTapped: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (formKey.currentState!.validate()) {
                              cubit.login(
                                password: passwordController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                          width: double.infinity);
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: AuthTextButton(
                      firstTitle: 'ليس لديك حساب؟',
                      secondTitle: 'انشاء حساب',
                      onPressed: () {
                        Navigator.pushNamed(
                            context, ScreenName.registerScreen,);
                      },
                    ),
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
