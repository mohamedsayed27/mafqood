import 'package:flutter/material.dart';
import 'package:mafqood/core/app_router/screens_name.dart';
import 'package:mafqood/presentation/screens/main_layout_screens/search_screen.dart';

import '../../../core/constants/constants.dart';
import '../../widgets_and_components/main_layout_widgets/custom_bottom_nav_bar.dart';
import '../chat_screens/messages_screen.dart';
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
    const MessagesScreen(),
  ];
  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentScreenIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, ScreenName.addLostScreen);
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: currentScreenIndex,
          onChanged: (int index) {
            if (currentScreenIndex != index) {
              print(token);
              setState(() {
                currentScreenIndex = index;
              });
            }
          },
        ),
      ),
    );
  }
}
