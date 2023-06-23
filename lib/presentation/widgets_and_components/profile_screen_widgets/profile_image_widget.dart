import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/assets_path/images_path.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                          child: Image.asset(
                            ImagesPath.anonymous,
                            fit: BoxFit.contain,
                          ),
                        ),
                    barrierDismissible: true);
              },
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              child: Container(
                height: 120.h,
                width: 120.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.9), blurRadius: 6.r)
                  ],
                ),
                child: Image.asset(
                  ImagesPath.anonymous,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10.h,
              right: 5.w,
              child: SizedBox(
                height: 40.h,
                width: 40.w,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(), padding: EdgeInsets.zero),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 22.r,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
