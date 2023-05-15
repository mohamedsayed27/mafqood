import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/theme/app_colors_light_theme.dart';

class BottomNavBarWidget extends StatefulWidget {
  final int selectedIndex;
  final void Function(int index) onChanged;
  const BottomNavBarWidget({Key? key, required this.selectedIndex, required this.onChanged}) : super(key: key);

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  late int currentIndex ;

  @override
  void initState() {
    currentIndex = widget.selectedIndex;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 342.w,
      decoration: BoxDecoration(
          color: AppColorsLightTheme.primaryColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
                offset: Offset(2.w, 4.h),
                blurRadius: 6.r,
                color: Colors.black.withOpacity(0.25))
          ],),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              side: const BorderSide(
                  color: Colors.transparent
              ),
              foregroundColor: Colors.white60,
              backgroundColor: AppColorsLightTheme.primaryColor,
              shape: const CircleBorder(),
            ),
            onPressed: () {
              currentIndex = 0;
              widget.onChanged(currentIndex);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera,
                  size: 28.r,
                  color: currentIndex == 0?Colors.white:Colors.grey,
                ),
                SizedBox(height: 2.h,),
                Text(
                  "data",
                  style: TextStyle(fontSize: 14.sp),
                )
              ],
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              side: const BorderSide(
                  color: Colors.transparent
              ),
              foregroundColor: Colors.white60,
              backgroundColor: AppColorsLightTheme.primaryColor,
              shape: const CircleBorder(),
            ),
            onPressed: () {
              currentIndex = 1;
              widget.onChanged(currentIndex);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera,
                  size: 28.r,
                  color: currentIndex == 1?Colors.white:Colors.grey,
                ),
                SizedBox(height: 2.h,),
                Text(
                  "data",
                  style: TextStyle(fontSize: 14.sp),
                )
              ],
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              side: const BorderSide(
                  color: Colors.transparent
              ),
              foregroundColor: Colors.white60,
              backgroundColor: AppColorsLightTheme.primaryColor,
              shape: const CircleBorder(),
            ),
            onPressed: () {
              currentIndex = 2;
              widget.onChanged(currentIndex);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera,
                  size: 28.r,
                  color: currentIndex == 2?Colors.white:Colors.grey,
                ),
                SizedBox(height: 2.h,),
                Text(
                  "data",
                  style: TextStyle(fontSize: 14.sp),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
