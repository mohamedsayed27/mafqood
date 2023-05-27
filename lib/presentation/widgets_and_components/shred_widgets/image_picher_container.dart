import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/theme/app_colors_light_theme.dart';

import '../../../core/assets_path/fonts_path.dart';

class ImagePickerContainer extends StatelessWidget {
  final File? image;
  final void Function()? pickImageFromCamera;
  final void Function()? pickImageFromGallery;
  final void Function()? chooseAnotherImage;

  const ImagePickerContainer({Key? key, this.image, this.pickImageFromCamera, this.pickImageFromGallery, this.chooseAnotherImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:image!=null? chooseAnotherImage:null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 214.w,
            height: 190.h,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: AppColorsLightTheme.authTextFieldFillColor,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2.w, 4.h),
                  blurRadius: 6.r,
                  color: Colors.black.withOpacity(0.25),
                )
              ],
            ),
            child: image == null
                ? Column(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: pickImageFromCamera,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                color: AppColorsLightTheme.bottomNavBarGreyIconColor,
                                size: 55.r,
                              ),
                              Text(
                                'افتح الكاميرا',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: FontsPath.sukarBold,
                                  color: AppColorsLightTheme.bottomNavBarGreyIconColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: pickImageFromGallery,
                        child: Container(
                          height: 50.h,
                          width: 214.w,
                          decoration: BoxDecoration(
                            color: AppColorsLightTheme.bottomNavBarGreyIconColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'اضف صوره من المعرض',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: FontsPath.sukarBold,
                                color: AppColorsLightTheme.whitTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Image.file(
                    image!,
                    fit: BoxFit.cover,
                    opacity:const AlwaysStoppedAnimation(0.5),
                  ),
          ),
          if(image!=null)Icon(Icons.camera_alt,color: Colors.black38,size: 55.r,)
        ],
      ),
    );
  }
}
