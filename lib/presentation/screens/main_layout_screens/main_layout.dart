import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/presentation/screens/main_layout_screens/search_person_screen.dart';
import 'package:mafqood/presentation/screens/main_layout_screens/upload_data_screen.dart';

import '../../../core/global/theme/app_colors_light_theme.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> screens = [const UploadData(), const SearchPerson(),];
  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedFontSize: 13.sp,
          unselectedFontSize: 12.sp,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColorsLightTheme.primaryColor,
          unselectedItemColor: Colors.grey,
          currentIndex: currentScreenIndex,
          selectedLabelStyle: const TextStyle(
            color: AppColorsLightTheme.primaryColor,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
          ),
          onTap: (index){
            setState(() {
              currentScreenIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home
              ),
              label: 'ارفاق بيانات',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.person
              ),
              label: 'بحث عن مجهول',
            ),
          ],
        ),
      ),
    );
  }
}
