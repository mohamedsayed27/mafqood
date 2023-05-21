import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/theme/app_colors_light_theme.dart';

import '../../../core/assets_path/svg_path.dart';
import 'bottom_nav_bar_icon_widget.dart';

class BottomNavBarWidget extends StatefulWidget {
  final int selectedIndex;
  final void Function(int index) onChanged;

  const BottomNavBarWidget(
      {Key? key, required this.selectedIndex, required this.onChanged})
      : super(key: key);

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  late int currentIndex;

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
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavBarIcon(
            onTap: () {
              currentIndex = 0;
              widget.onChanged(currentIndex);
            },
            index: 0,
            currentIndex: currentIndex,
            iconPath: SvgPath.homeIcon,
            label: 'الرئيسية',
          ),
          BottomNavBarIcon(
            onTap: () {
              currentIndex = 1;
              widget.onChanged(currentIndex);
            },
            index: 1,
            currentIndex: currentIndex,
            iconPath: SvgPath.searchIcon,
            label: 'بحث',
          ),
          BottomNavBarIcon(
            onTap: () {
              currentIndex = 2;
              widget.onChanged(currentIndex);
            },
            index: 2,
            iconHeight: 32.h,
            iconWidth: 32.w,
            currentIndex: currentIndex,
            iconPath: SvgPath.addIcon,
            label: 'إضافة',
          ),
        ],
      ),
    );
  }
}
