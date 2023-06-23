import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/assets_path/fonts_path.dart';
import 'package:mafqood/core/theme/app_colors_light_theme.dart';
import 'package:mafqood/presentation/widgets_and_components/profile_screen_widgets/profile_image_widget.dart';

class ProfileDataWidgets extends StatefulWidget {
  const ProfileDataWidgets({Key? key}) : super(key: key);

  @override
  State<ProfileDataWidgets> createState() => _ProfileDataWidgetsState();
}

class _ProfileDataWidgetsState extends State<ProfileDataWidgets> {
  TextEditingController nameController = TextEditingController();
  bool isUpdate = false;
  String name = "Mohamed";

  @override
  void initState() {
    nameController.text = name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileImageWidget(),
        SizedBox(
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 60.w,
              height: 60.h,
            ),
            Expanded(
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  enabled: isUpdate,
                  border: isUpdate == false ? InputBorder.none : null,
                ),
                textAlign: TextAlign.center,
                onChanged: (v) {
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              width: 60.w,
              height: 60.h,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isUpdate = !isUpdate;
                    });
                  },
                  icon: const Icon(Icons.edit_rounded)),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        ElevatedButton(
          onPressed: nameController.text != name ? () {} : null,
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.r))),
          child: Text(
            "تعديل",
            style: TextStyle(
                color: AppColors.whitColor,
                fontFamily: FontsPath.sukarBold,
                fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
