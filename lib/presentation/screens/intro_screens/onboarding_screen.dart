import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/cache_manager/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/cache_manager/cache_keys.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/intro_screens_widgets/boarding_button.dart';
import '../../widgets_and_components/intro_screens_widgets/images_widget.dart';
import '../../widgets_and_components/intro_screens_widgets/onboarding_class.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageViewController = PageController();
  bool isLast = false;
  List<OnboardingModel> boarding = [
    OnboardingModel(
        backGround: ImagesPath.onboarding1,
        title: 'تعرف علي تطبيق مفقود',
        bodyTitle:
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى من مولد النص العربى'),
    OnboardingModel(
        backGround: ImagesPath.onboarding2,
        title: 'تعرف علي تطبيق مفقود',
        bodyTitle:
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى من مولد النص العربى'),
    OnboardingModel(
        backGround: ImagesPath.onboarding3,
        title: 'تعرف علي تطبيق مفقود',
        bodyTitle:
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى من مولد النص العربى')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: PageView.builder(
              controller: pageViewController,
              itemCount: boarding.length,
              itemBuilder: (BuildContext context, int index) {
                return ImagesWidget(
                  model: boarding[index],
                );
              },
              onPageChanged: (index) {
                if (index == 2 && !isLast) {
                  setState(() {
                    isLast = true;
                  });
                }
                if (index == 1 || index == 0 && isLast) {
                  setState(() {
                    isLast = false;
                  });
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 220.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: pageViewController,
                count: boarding.length,
                effect: ExpandingDotsEffect(
                    dotHeight: 9.h,
                    dotWidth: 9.w,
                    expansionFactor: 3,
                    spacing: 5.w,
                    activeDotColor: AppColors.primaryColor,
                    dotColor: AppColors.whitColor),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 100.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomBoardingButton(
                isLast: isLast,
                isLastTap: () {
                  CacheHelper.saveData(key: CacheKeys.onboarding, value: true)
                      .then((value) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, ScreenName.loginScreen, (route) => false);
                  });
                },
                isTapped: () {
                  pageViewController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
