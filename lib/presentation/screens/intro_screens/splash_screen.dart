import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/app_router/screens_name.dart';
import '../../../core/cache_manager/cache_keys.dart';
import '../../../core/cache_manager/shared_preferences.dart';
import '../../../core/constants/constants.dart';
import '../../../core/global/assets_path/fonts_path.dart';
import '../../../core/global/assets_path/images_path.dart';
import '../../../core/global/theme/app_colors_light_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<AlignmentGeometry>? scaleAnimation;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    scaleAnimation = Tween<AlignmentGeometry>(
      begin:Alignment.topCenter,
      end: Alignment.center,
    ).animate(CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
    controller!.repeat(reverse: true,);
    _loading();
    super.initState();
  }

  _loading() {
    bool? onboarding = CacheHelper.getData(key: CacheKeys.onboarding);
    token = CacheHelper.getData(key: CacheKeys.token);
    Timer(
      const Duration(seconds: 3),
      () {
        if (onboarding == null) {
          Navigator.pushReplacementNamed(context, ScreenName.onboardingScreen);
        } else if (token != null) {
        } else {
          Navigator.pushReplacementNamed(context, ScreenName.loginScreen);
        }
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // t
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLightTheme.primaryColor,
      body: Center(
        child: SizedBox(
          height: 370.h,
          child: AlignTransition(
            alignment: scaleAnimation!,
            child: SizedBox(
              height: 320.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      ImagesPath.splashLogo,
                      height: 220.h,
                      width: 120.w,
                    ),
                  ),
                  SizedBox(
                    height: 15.5.h,
                  ),
                  Text(
                    'مفقود',
                    style: TextStyle(
                      color: AppColorsLightTheme.whitTextColor,
                      fontFamily: FontsPath.sukarBold,
                      fontSize: 42.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
