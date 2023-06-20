import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/app_router/screens_name.dart';
import 'package:mafqood/core/assets_path/images_path.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_cubit.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_state.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/search_widget_builder.dart';
import '../../widgets_and_components/shred_widgets/custom_button.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    var cubit = LostPeopleCubit.get(context);
    if (cubit.getAllSurvivalsDataList.isEmpty) {
      cubit.allSurvivalPageNumber = 1;
      cubit.getAllSurvivals();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, isScrolling) => [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  const LogoText(),
                  Text(
                    'مرحباً . . .',
                    style: TextStyle(
                      color: AppColorsLightTheme.blueTextColor,
                      fontFamily: FontsPath.sukarBlack,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
                    style: TextStyle(
                      color: AppColorsLightTheme.bottomNavBarGreyIconColor,
                      fontFamily: FontsPath.sukarBold,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'تتفاصيل التطبيق',
                    style: TextStyle(
                      color: AppColorsLightTheme.blueTextColor,
                      fontFamily: FontsPath.sukarBlack,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
                          style: TextStyle(
                            color: AppColorsLightTheme.bottomNavBarGreyIconColor,
                            fontFamily: FontsPath.sukarBold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                      Image.asset(
                        ImagesPath.chart,
                        width: 182.w,
                        height: 155.h,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                'المفقودين الناجيين',
                style: TextStyle(
                  color: AppColorsLightTheme.blueTextColor,
                  fontFamily: FontsPath.sukarBlack,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: BlocConsumer<LostPeopleCubit, LostPeopleState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = LostPeopleCubit.get(context);
                    return state is GetAllSurvivalsDataLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : ListView.builder(
                            itemCount: cubit.getAllSurvivalsDataList.length > 5
                                ? 5
                                : cubit.getAllSurvivalsDataList.length,
                            itemBuilder: (BuildContext context, int index) {
                              if(index == 5-1){
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h,),
                                  child: Column(
                                    children: [
                                      SearchWidgetBuilder(
                                        textDirection: index % 2 == 0
                                            ? TextDirection.ltr
                                            : TextDirection.rtl,
                                        getAllLostDataEntity:
                                        cubit.getAllSurvivalsDataList[index],
                                      ),
                                      SizedBox(height: 10.h,),
                                      CustomButton(
                                        buttonTitle: 'مشاهدة الكل',
                                        buttonColor: AppColorsLightTheme.primaryColor,
                                        textColor: AppColorsLightTheme.whitTextColor,
                                        isTapped: () {
                                          Navigator.pushNamed(context, ScreenName.allSurvivalsScreen);
                                        },
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
                                );
                              }else{
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: SearchWidgetBuilder(
                                    textDirection: index % 2 == 0
                                        ? TextDirection.ltr
                                        : TextDirection.rtl,
                                    getAllLostDataEntity:
                                    cubit.getAllSurvivalsDataList[index],
                                  ),
                                );
                              }
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
