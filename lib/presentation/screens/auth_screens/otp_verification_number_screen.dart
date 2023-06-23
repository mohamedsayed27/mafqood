import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/constants/constants.dart';
import 'package:mafqood/presentation/controllers/user_cubit/user_cubit.dart';
import 'package:mafqood/presentation/controllers/user_cubit/user_state.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/auth_widgets/pin_field_builder.dart';
import '../../widgets_and_components/shred_widgets/custom_button.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';
import '../../widgets_and_components/shred_widgets/phone_form_field.dart';

class OtpVerificationNumberScreen extends StatefulWidget {
  final String phone;
  const OtpVerificationNumberScreen({Key? key, required this.phone}) : super(key: key);

  @override
  State<OtpVerificationNumberScreen> createState() =>
      _OtpVerificationNumberScreenState();
}

class _OtpVerificationNumberScreenState
    extends State<OtpVerificationNumberScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pinFieldController = TextEditingController();

  @override
  void initState() {
    phoneController.text = widget.phone;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whitColor,
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
                  'تفعيل رقم الهاتف',
                  style: TextStyle(
                    color: AppColors.blueTextColor,
                    fontFamily: FontsPath.sukarBlack,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                RichText(
                  text: TextSpan(
                    text: 'ادخل رقم الهاتف و الكود المرسل  ',
                    children: [
                      TextSpan(
                        text: 'SMS',
                        style: TextStyle(
                          color: AppColors.blueTextColor,
                          fontFamily: FontsPath.sukarBold,
                          fontSize: 18.sp,
                        ),
                      ),
                      TextSpan(
                        text: '  لتأكيد الحساب',
                        style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontFamily: FontsPath.sukarBlack,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                    style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontFamily: FontsPath.sukarBlack,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                PhoneFormField(hintText: 'رقم الهاتف',
                  isEnable: false,
                  controller: phoneController,),
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
                  height: 26.h,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'اعادة ارسال كود  ',
                      children: [
                        TextSpan(
                          text: 'SMS',
                          style: TextStyle(
                            color: AppColors.blueTextColor,
                            fontFamily: FontsPath.sukarBold,
                            fontSize: 16.sp,
                          ),
                        )
                      ],
                      style: TextStyle(
                        color: AppColors.greyTextColor,
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
                  buildWhen: (p,c){
                    return false;
                  },
                  listener: (context, state) {
                    if(state is VerifyPhoneLoading){
                      showProgressIndicator(context);
                    }
                    if(state is VerifyPhoneSuccess){
                      Navigator.pop(context);
                      showToast(errorType: 0, message: state.authenticationEntity.message!);
                      Navigator.pushNamedAndRemoveUntil(context, ScreenName
                          .loginScreen, (route) => false);
                    }
                    if(state is VerifyPhoneError){
                      Navigator.pop(context);
                      showToast(errorType: 1, message: state.authErrorException.authErrorModel.errors[0]);
                    }
                  },
                  builder: (context, state) {
                    var cubit = UserCubit.get(context);
                    return CustomButton(
                        buttonTitle: 'تفعيل',
                        isTapped: () {
                          cubit.verifyPhone(code: pinFieldController.text, phone: phoneController.text);
                        },
                        width: double.infinity);
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
