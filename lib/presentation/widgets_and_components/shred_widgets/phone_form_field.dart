import 'package:flutter/material.dart';

import '../../../core/constants/reg_exp.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../auth_widgets/custom_text_form_field.dart';

class PhoneFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isEnable;
  const PhoneFormField({Key? key, required this.hintText, required this.controller, this.isEnable = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      isEnable: isEnable,
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.phone,
      prefix: const Icon(
        Icons.phone,
        color: AppColors.primaryColor,
      ),
      validate: (value) {
        if (value!.isEmpty) {
          return "يجب ادخال الهاتف";
        } else if (!RegularExp.egyptPhoneRegex.hasMatch(value)) {
          return "صيغة الهاتف غير صحيحة";
        }
        return null;
      },
    );
  }
}
