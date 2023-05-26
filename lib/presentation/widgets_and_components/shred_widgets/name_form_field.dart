import 'package:flutter/material.dart';

import '../../../core/theme/app_colors_light_theme.dart';
import '../auth_widgets/custom_text_form_field.dart';

class NameFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const NameFormField({Key? key, required this.hintText, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: hintText,
      controller: controller,
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
    );
  }
}
