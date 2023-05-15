import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/auth_widgets/auth_text_form_field.dart';
import '../../widgets_and_components/search_widget_builder.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';
import '../../widgets_and_components/shred_widgets/upload_data_component.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            const LogoText(),
            SizedBox(
              height: 20.h,
            ),
            AuthTextFormField(
              onTap: (){},
              hintText: "البحث",
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              prefix: Icon(
                Icons.search_off_sharp,
                color: AppColorsLightTheme.primaryColor,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(child: ListView.builder(itemCount: 5,itemBuilder: (BuildContext context, int index) { return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: SearchWidgetBuilder(textDirection: index%2==0?TextDirection.ltr:TextDirection.rtl,),
            ); },)),
          ],
        ),
      ),
    );
  }
}
