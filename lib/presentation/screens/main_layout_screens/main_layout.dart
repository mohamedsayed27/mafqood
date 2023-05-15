import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/presentation/screens/main_layout_screens/search_person_screen.dart';
import 'package:mafqood/presentation/screens/main_layout_screens/upload_data_screen.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/main_layout_widgets/bottom_nav_bar_widget.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> screens = [
    const UploadData(),
    const SearchPerson(),
  ];
  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(token);
    return SafeArea(
      child: Scaffold(
        // body: screens[currentScreenIndex],
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 43.w, right: 43.w, bottom: 24.h),
          child: BottomNavBarWidget(
            selectedIndex: currentScreenIndex,
            onChanged: (int index) {
              setState(() {
                currentScreenIndex = index;
                print(index);
                print(currentScreenIndex);
              });
            },
          ),
        ),
      ),
    );
  }
}
