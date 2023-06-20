import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/assets_path/svg_path.dart';
import 'package:mafqood/core/theme/app_colors_light_theme.dart';

import 'bottom_nav_bar_icon_widget.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int index) onChanged;

  const CustomBottomNavigationBar(
      {Key? key, required this.selectedIndex, required this.onChanged})
      : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.r,
      color: AppColorsLightTheme.whitColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      surfaceTintColor: Colors.transparent,
      height: 70.h,
      child: Container(
        height: 70.h,
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomNavBarIcon(
                  label: "الرئيسية",
                  iconPath: SvgPath.homeIcon,
                  onTap: () {
                    currentIndex = 0;
                    widget.onChanged(currentIndex);
                  },
                  currentIndex: currentIndex,
                  index: 0,
                ),
                BottomNavBarIcon(
                  label: "بحث",
                  iconPath: SvgPath.searchIcon,
                  onTap: () {
                    currentIndex = 1;
                    widget.onChanged(currentIndex);
                  },
                  currentIndex: currentIndex,
                  index: 1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomNavBarIcon(
                  label: "الرسائل",
                  iconPath: SvgPath.messageIcon,
                  onTap: () {
                    currentIndex = 2;
                    widget.onChanged(currentIndex);
                  },
                  currentIndex: currentIndex,
                  index: 2,
                ),
                BottomNavBarIcon(
                  label: "الشخصيه",
                  iconPath: SvgPath.userIcon,
                  onTap: () {
                    currentIndex = 3;
                    widget.onChanged(currentIndex);
                  },
                  currentIndex: currentIndex,
                  index: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
