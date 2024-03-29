import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/add_lost_widgets/add_lost_from_anonymous.dart';
import '../../widgets_and_components/add_lost_widgets/add_lost_from_family.dart';
import '../../widgets_and_components/shred_widgets/arrow_back_button.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';

class AddLostPeopleScreen extends StatelessWidget {
  const AddLostPeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: DefaultTabController(
              length: 2,
              child: NestedScrollView(
                headerSliverBuilder: (context, isScrolling) => [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        const LogoText(),
                        const ArrowBackButton(),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'إضافة شخص تائه',
                          style: TextStyle(
                            color: AppColors.blueTextColor,
                            fontFamily: FontsPath.sukarBlack,
                            fontSize: 24.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ],
                body: Column(
                  children: [
                    SizedBox(
                      height: 70.h,
                      child: const TabBar(
                        labelColor: AppColors.primaryColor,
                        unselectedLabelColor:
                            AppColors.bottomNavBarGreyIconColor,
                        labelStyle: TextStyle(
                          fontFamily: FontsPath.sukarBold,
                        ),
                        unselectedLabelStyle: TextStyle(
                          fontFamily: FontsPath.sukarRegular,
                        ),
                        tabs: [
                          Tab(
                            text: "اضافة من الاهل",
                          ),
                          Tab(
                            text: "اضافة من مجهول",
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
                          ListView(
                            children: const [
                              AddLostPersonFromFamily(),
                            ],
                          ),
                          ListView(
                            children: const [
                              AddLostPersonFromAnonymous(),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
