import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/app_router/app_router.dart';
import 'package:mafqood/core/app_router/screens_name.dart';
import 'package:mafqood/core/cache_manager/shared_preferences.dart';
import 'package:mafqood/core/network/dio_helper.dart';
import 'package:mafqood/presentation/screens/auth_screens/change_forget_password.dart';
import 'package:mafqood/presentation/screens/auth_screens/forget_password_screen.dart';
import 'package:mafqood/presentation/screens/auth_screens/login_screen.dart';
import 'package:mafqood/presentation/screens/auth_screens/otp_verification_number_screen.dart';
import 'package:mafqood/presentation/screens/auth_screens/register_screen.dart';

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
          title: 'مفقود',
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
          ],
          theme: ThemeData(
            primarySwatch: createMaterialColor(AppColorsLightTheme.primaryColor),
          ),
          // onGenerateRoute: AppRouter.generateRoute,
          // initialRoute: ScreenName.splashscreen,
          home:  ChangeForgottenPassword(),
        );
      },
    );
  }
}
