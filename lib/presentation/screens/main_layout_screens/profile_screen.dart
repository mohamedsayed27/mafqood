import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/lost_people_widget_builder.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../../domain/entities/lost_person_data_entity.dart';
import '../../widgets_and_components/profile_screen_widgets/family_card_widget.dart';
import '../../widgets_and_components/profile_screen_widgets/profile_data_widget.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: NestedScrollView(
            headerSliverBuilder: (context, isScroll) => [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    const LogoText(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const ProfileDataWidgets(),
                  ],
                ),
              ),
            ],
            body: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 70.h,
                    child: const TabBar(
                      labelColor: AppColors.primaryColor,
                      unselectedLabelColor: AppColors.bottomNavBarGreyIconColor,
                      labelStyle: TextStyle(
                        fontFamily: FontsPath.sukarBold,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontFamily: FontsPath.sukarRegular,
                      ),
                      tabs: [
                        Tab(
                          text: "الاهل",
                        ),
                        Tab(
                          text: "مفقودين",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                      child: TabBarView(
                    children: [
                      GridView.count(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.8,
                        children: List.generate(
                          8,
                          (index) => const FamilyCardImage(),
                        ),
                      ),
                      ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return LostPeopleWidgetBuilder(
                            textDirection: index % 2 == 0
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            lostPersonDataEntity: LostPersonDataEntity(
                              name: "name",
                              city: "city",
                              dateAdded: DateTime.now().toIso8601String(),
                              id: 1,
                              url: "",
                            ),
                          );
                        },
                        itemCount: 10,
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
