import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/app_router/screens_name.dart';
import 'package:mafqood/domain/usecases/auth_usecases/register_usecase.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/custom_button.dart';

import '../../../core/constants/constants.dart';
import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';
import '../../controllers/user_cubit/user_cubit.dart';
import '../../controllers/user_cubit/user_state.dart';
import '../../widgets_and_components/shred_widgets/auth_text_button.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';
import '../../widgets_and_components/shred_widgets/name_form_field.dart';
import '../../widgets_and_components/shred_widgets/password_form_field.dart';
import '../../widgets_and_components/shred_widgets/phone_form_field.dart';

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
  final TextEditingController confirmPasswordController = TextEditingController();
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
                  const LogoText(),
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
                  NameFormField(
                    hintText: 'الاسم الاول', controller: firstNameController,),
                  SizedBox(
                    height: 24.h,
                  ),
                  NameFormField(hintText: 'الاسم الثاني',
                    controller: secondNameController,),
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
                  PasswordFormField(
                    hintText: 'كلمة المرور',
                    controller: confirmPasswordController,
                    isConfirmPassword: true,
                    confirmController: passwordController,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  BlocConsumer<UserCubit, UserState>(
                    buildWhen: (previous, current) {
                      return false;
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
                                RegisterParameter(
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                  firstName: firstNameController.text,
                                  lastName: secondNameController.text,
                                )
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
                    child: AuthTextButton(
                      firstTitle: 'هل لديك حساب؟',
                      secondTitle: 'تسجيل الدخول',
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, ScreenName.loginScreen, (route) => false);
                      },
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
