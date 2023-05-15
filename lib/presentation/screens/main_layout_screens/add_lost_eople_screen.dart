import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/add_lost_people_container.dart';
import '../../widgets_and_components/shred_widgets/image_picher_container.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';

class AddLostPeopleScreen extends StatelessWidget {
  const AddLostPeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                const LogoText(),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'إضافة شخص تائه',
                  style: TextStyle(
                    color: AppColorsLightTheme.blueTextColor,
                    fontFamily: FontsPath.sukarBlack,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                AddLostPeopleContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
