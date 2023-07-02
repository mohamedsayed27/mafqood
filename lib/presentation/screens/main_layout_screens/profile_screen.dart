import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_cubit.dart';
import 'package:mafqood/presentation/controllers/user_cubit/user_cubit.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/lost_people_widget_builder.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../../domain/entities/lost_person_data_entity.dart';
import '../../controllers/lost_people_cubit/lost_people_state.dart';
import '../../widgets_and_components/profile_screen_widgets/family_card_widget.dart';
import '../../widgets_and_components/profile_screen_widgets/profile_data_widget.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    if (LostPeopleCubit.get(context).myUploadedLostPeoplesList.isEmpty) {
      LostPeopleCubit.get(context).getMyLostPeopleList();
    }
    if(UserCubit.get(context).userDataModel==null){
      UserCubit.get(context).getUserData(token: token);
    }
    super.initState();
  }

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
                        BlocConsumer<LostPeopleCubit, LostPeopleState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            var cubit = LostPeopleCubit.get(context);
                            return ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return LostPeopleWidgetBuilder(
                                  containerDirection: index % 2 == 0
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  dateDirection: index % 2 == 0
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  lostPersonDataEntity: cubit.myUploadedLostPeoplesList[index],
                                );
                              },
                              itemCount: cubit.myUploadedLostPeoplesList.length,
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
