import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/presentation/screens/main_layout_screens/search_screen.dart';

import '../../../core/constants/constants.dart';
import '../../widgets_and_components/main_layout_widgets/bottom_nav_bar_widget.dart';
import 'add_lost_people_screen.dart';
import 'home_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const AddLostPeopleScreen(),
  ];
  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentScreenIndex],
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 43.w, right: 43.w, bottom: 24.h),
          child: BottomNavBarWidget(
            selectedIndex: currentScreenIndex,
            onChanged: (int index) {
              if(currentScreenIndex!=index){
                print(token);
                setState(() {
                  currentScreenIndex = index;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
