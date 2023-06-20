import 'package:flutter/material.dart';

import '../../../core/theme/app_colors_light_theme.dart';
import '../auth_widgets/custom_text_form_field.dart';

class PasswordFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextEditingController? confirmController;
  final bool isConfirmPassword;
  const PasswordFormField({Key? key, required this.hintText, required this.controller, this.isConfirmPassword=false, this.confirmController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      isPassword: true,
      prefix: const Icon(
        Icons.lock,
        color: AppColorsLightTheme.primaryColor,
      ),
      validate: (value) {
        if(isConfirmPassword){
            if (confirmController!.text !=
                controller.text) {
              return "كلمة المرور غير متطابقة";
            }
            return null;
        }else{
          if (value!.isEmpty) {
            return "يجب ادخال كلمة المرور";
          }
          return null;
        }
      },
    );
  }
}
