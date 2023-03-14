import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/app_router/app_router.dart';
import 'package:mafqood/core/app_router/screens_name.dart';
import 'package:mafqood/core/cache_manager/shared_preferences.dart';
import 'package:mafqood/core/network/dio_helper.dart';

import 'core/global/theme/app_colors_light_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: createMaterialColor(AppColorsLightTheme.primaryColor),
          ),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: ScreenName.splashscreen,
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
